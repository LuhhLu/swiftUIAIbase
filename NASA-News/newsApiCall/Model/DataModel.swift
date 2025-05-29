// DataModel.swift
import Foundation

// 顶层响应，只保留 results
struct ApiResponse: Decodable {
    let results: [Article]
}

// Article 模型
struct Article: Identifiable, Decodable {
    let id: Int
    let title: String
    let url: URL
    let imageUrl: URL
    let summary: String
    let newsSite: String
    let publishedAt: Date    // 我们要解成 Date
    let updatedAt: Date
    let featured: Bool
    let launches: [Launch]
    let events: [Event]

    struct Launch: Decodable {
        let launchId: String
        let provider: String
    }
    struct Event: Decodable {
        let eventId: String?
        let provider: String?
    }
}

