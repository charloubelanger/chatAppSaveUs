
import Foundation

final class Authentication {
    
    class func parseToken(_ token: String) -> (id: String, timestamp: String) {
        let id = token.prefix(36).replacingOccurrences(of: "sep", with: "-")
        let timestamp = token.dropFirst(36).prefix(10)
        return (id: String(id), timestamp: String(timestamp))
    }
}
