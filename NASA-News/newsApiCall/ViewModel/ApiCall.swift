import Foundation

class ViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private let baseURL = "https://api.spaceflightnewsapi.net/v4/articles"
    
    // 顶层响应
    struct ApiResponse: Decodable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [Article]
    }
    
    // 文章模型
    struct Article: Decodable, Identifiable {
        let id: Int
        let title: String
        let url: URL
        let imageUrl: URL        // 对应 JSON 的 "image_url"
        let newsSite: String     // 对应 JSON 的 "news_site"
        let summary: String
        let publishedAt: Date    // 对应 JSON 的 "published_at"
        let updatedAt: Date      // 对应 JSON 的 "updated_at"
        let featured: Bool
        let launches: [Launch]
        let events: [Event]
        
        // 子模型
        struct Launch: Decodable {
            let launchId: String  // 对应 JSON 的 "launch_id"
            let provider: String
        }
        struct Event: Decodable {
            let eventId: String?  // 对应 JSON 的 "event_id"
            let provider: String?
        }
    }
    
    private lazy var session: URLSession = {
        let cfg = URLSessionConfiguration.ephemeral
        cfg.waitsForConnectivity = true
        cfg.timeoutIntervalForRequest = 30
        cfg.timeoutIntervalForResource = 60
        return URLSession(configuration: cfg)
    }()
        
    func fetchData() {
        // 分页 & 限流，避免一次拉太多数据
        let fullURL = "\(baseURL)?limit=20&page=1"
        guard let url = URL(string: fullURL) else { return }

        session.dataTask(with: url) { [weak self] data, _, error in
            // 模拟器偶发的网络丢失，再重试一次
            if let err = error as NSError?,
               err.domain == NSURLErrorDomain && err.code == NSURLErrorNetworkConnectionLost {
                DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    self?.fetchData()
                }
                return
            }

            guard let data = data, error == nil else {
                print("Network error:", error?.localizedDescription ?? "未知")
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            // 自定义 ISO8601 解码，兼容有/无毫秒
            let rfcFormatter = ISO8601DateFormatter()
            rfcFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            let basicFormatter = ISO8601DateFormatter()
            basicFormatter.formatOptions = [.withInternetDateTime]

            decoder.dateDecodingStrategy = .custom { decoder in
                let container = try decoder.singleValueContainer()
                let str = try container.decode(String.self)
                if let d = rfcFormatter.date(from: str) {
                    return d
                }
                if let d = basicFormatter.date(from: str) {
                    return d
                }
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "无法解析的日期字符串：\(str)"
                )
            }

            do {
                let resp = try decoder.decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.articles = resp.results
                }
            } catch {
                print("Decoding error:", error)
            }
        }
        .resume()
    }
}

