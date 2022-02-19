
import Foundation
import Vapor

final class Sessions {
    
    static var all: [String:Session] = [:]
    
    static var professionals: [ String: (name: String, location: String, token: String)] = [ "999-514": (
        name: "Nicolas Young",
        location: "Montreal, QC, Canada",
        token: "bab1298d948ebb34bd0f3faf5e596ebc0b27c615"
    )]
    
    final class Session {
        
        internal init(id: UUID, session_id: String, user: Sessions.User, timestamp: Int) {
            self.id = id
            self.session_id = session_id
            self.users = [user]
            self.timestamp = timestamp
        }
        
        var id: UUID
        var session_id: String
        var users: [User]
        var messages: [Message] = []
        var socket: Vapor.WebSocket? = nil
        var timestamp: Int
    }
    
    final class Message: Codable {
        
        internal init(content: String, id: String, author: Sessions.User, timestamp: Int, attachments: [String], userID: String) {
            self.content = content
            self.id = id
            self.author = author
            self.timestamp = timestamp
            self.attachments = attachments
            self.user_id = userID
        }
        
        var content: String
        var id: String
        var author: User
        var timestamp: Int
        var attachments: [String]
        var user_id: String
        
    }
    
    final class User: Codable {
        internal init(username: String, avatar: String? = nil, age: Int? = nil) {
            self.username = username
            self.avatar = avatar
            self.age = age
        }
        
        var username: String
        var avatar: String?
        var age: Int?
    }
}
