
import Vapor
import Foundation

func routes(_ app: Application) throws {
    
    app.get { req in
        return "hiiiii uwu >.<"
    }
    
    app.on(.POST, ":channel", "messages") { req -> HTTPResponseStatus in
        guard let content = req.headers["content"].first,
              let channel = req.parameters.get("channel"),
              let token = req.headers["Authorization"].first else {
                  return HTTPStatus.badRequest
        }
        
        guard ((Sessions.all[channel]?.id.uuidString ?? "") + String(Sessions.all[channel]?.timestamp ?? 0)) == token else { return HTTPStatus.badRequest }
        
        let values = Authentication.parseToken(token)
        
        let message = Sessions.Message(
            content: content,
            id: UUID().uuidString,
            author: Sessions.User (
                username: Sessions.all[channel]?.users.first?.username ?? "Unknown User",
                avatar: Sessions.all[channel]?.users.first?.avatar,
                age: Sessions.all[channel]?.users.first?.age
            ),
            timestamp: Int(Date().timeIntervalSince1970),
            attachments: [],
            userID: values.id
        )
        
        print(message)
        
        Sessions.all[channel]?.messages.append(message)
        
        dump(Sessions.all[channel]?.messages)
        
        return HTTPStatus.ok
    }
    
    app.on(.GET, ":channel", "messages") { req -> String in
        guard let channel = req.parameters.get("channel"),
              let token = req.headers["Authorization"].first else {
                  return "{}"
        }
        
        guard ((Sessions.all[channel]?.id.uuidString ?? "") + String(Sessions.all[channel]?.timestamp ?? 0)) == token else { return "{}" }
        
        guard let messages = try? JSONEncoder().encode(Sessions.all[channel]?.messages),
              let string = String(data: messages, encoding: .utf8) else { return "{}" }
        
        return string
    }
    
    app.on(.DELETE, ":channel", "messages", ":messageID") { req -> HTTPResponseStatus in
        guard let channel = req.parameters.get("channel"),
              let messageID = req.parameters.get("messageID"),
              let token = req.headers["Authorization"].first else {
                  return HTTPStatus.badRequest
        }
        
        guard ((Sessions.all[channel]?.id.uuidString ?? "") + String(Sessions.all[channel]?.timestamp ?? 0)) == token else { return HTTPStatus.badRequest }
        
        dump(Sessions.all[channel]?.messages)
        
        Sessions.all[channel]?.messages.removeAll(where: { $0.id == messageID })
        
        dump(Sessions.all[channel]?.messages)

        return HTTPStatus.ok
    }
    
    app.get("gateway", "url") { req -> String in
        return "ws://165.227.107.161:8080/gateway"
    }
    
    app.on(.POST, "login") { req -> Response in
        guard let id = req.headers["identifier"].first else {
                  return Response(
                    status: HTTPStatus.badRequest,
                    version: .http2,
                    headers: [:],
                    body: .init()
                )
        }
        
        guard let user = Sessions.professionals[id],
        let packet = try? [
            "t":"LOGIM",
            "name":user.name,
            "id":id,
        ].jsonString() else {
            return Response (
                status: HTTPStatus.custom(code: 400, reasonPhrase: "Not registered"),
                version: .http2,
                headers: [:],
                body: .init()
            )
        }
        
        Sessions.all.forEach { session in
            session.value.socket?.send(packet, promise: nil)
        }
        return Response.init(status: .ok, version: .http2, headers: [:], body: Response.Body.init(string: user.token))
    }
    
    app.webSocket("gateway", onUpgrade: { req, ws in
        
        let sessionID = UUID().uuidString
        
        guard let hello: String = try? [
            "session_id":sessionID,
            "interval":45000
        ].jsonString() else {
            _ = ws.close(code: .unexpectedServerError)
            return
        }
        
        ws.send(hello, promise: nil)
        
        ws.onText { ws, string in
            if let data = string.data(using: .utf8),
               let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                guard let op = dict["op"] as? Int else { return }
                switch op {
                case 1:
                    print("heartbeat")
                case 2:
                    // IDENTIFY
                    if let packet = dict["d"] as? [String:Any],
                       let username = packet["username"] as? String {
                        let sessionDate = Int(Date().timeIntervalSince1970)
                        let age = packet["age"] as? Int
                        let avatar = packet["avatar"] as? String
                        let userID = UUID()
                        
                        Sessions.all[sessionID] = Sessions.Session.init(id: userID, session_id: sessionID, user: Sessions.User.init(
                            username: username,
                            avatar: avatar,
                            age: age
                        ), timestamp: sessionDate)
                        
                        let packet = try? [
                            "t":"READY",
                            "available_professionals":Sessions.professionals.map {
                                ["location":$0.value.location, "name": $0.value.name]
                            },
                            "token":userID.uuidString + String(sessionDate)
                        ].jsonString()
                        
                        print(userID.uuidString + String(sessionDate))
                        
                        guard let ready = packet else {
                            ws.send(#"["error":"Internal Server Error"]"#, promise: nil)
                            _ = ws.close(code: .unexpectedServerError)
                            return
                        }
                        
                        print(ready, "READY UP")
                        
                        ws.send(
                            ready,
                            promise: nil
                        )
                        
                        Sessions.all[sessionID]?.socket = ws
                    }
                default: break
                }
            }
        }
    })
    
}
