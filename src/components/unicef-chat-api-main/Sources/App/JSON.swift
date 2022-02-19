
import Foundation

extension Collection {
    func jsonString() throws -> String? {
        let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String(data: data, encoding: .utf8)
    }
}
