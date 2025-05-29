import Foundation

class TextBuilder {
    
    static var shared = TextBuilder()
    
    func durationText(parammeters: (hours: Int, minutes: Int, seconds: Int)? = nil) -> String {
        var params = parammeters
        if params == nil {
            params = TimeManager.shared.duration.extractTimeComponents()
        }
        guard let params = params else {return ""}
        var components: [String] = []
        if params.hours > 0 {
            components.append("\(params.hours) h")
        }
        if params.minutes > 0 {
            components.append("\(params.minutes) min")
        }
        if params.seconds > 0 {
            components.append("\(params.seconds) sec")
        }
        return components.joined(separator: ", ")
    }
}
