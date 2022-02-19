# Unicef Chat API 
## Made for BrebeufHX 5.0 (2022)

## REST API

### Root

`GET /`

Returns: 
- Some message to indicate server is alive

### Gateway URL

`GET /gateway/url` 

Returns: 
- String with url to connect to the gateway

### Professional login

`POST /login` 

Headers: 
- ID: Registered Professional ID

Returns: 
- Token for professional's session

### Message sending

`POST /:sessionid/messages

Headers: 
- content: `String` Message content
- (Optional) translate: `Bool` Whether message should be translated or not

## Gateway
### Loosely based on Discord's Gateway implementation

### Packet structure: 
- OP: 
    - `op` field: Int
        - Represents the event number
- t (Optional): 
    - `t` field: String
        - Represents the event
- d (Optional): 
    - `d` field: Dictionary<String, Any>
        - Contains the actual data
        
### Opcodes

- 1: `Heartbeat`
    - Sent by client with opcode 1 and nothing else every interval (interval is sent in the READY event)
    - Missing 2 heartbeats will trigger a disconnect
- 2: `IDENTIFY`
    - Contains the info about the user's session
    - Parameters: 
        - username: (String) User's name
        - age (Optional): (Int) User's age
        - avatar (Optional): (String) User's avatar
- 3: `LOGIN`
    - Notifies the client that a professional logged in
    - Fields: 
        - name: (String) Name of the professional
        - id: (String) public id of the professional
        - location: (String) localized location of the user

### Events

- HELLO: 
    - Sent after a successful websocket handshake
    - Fields: 
        - sessionid: (String) Session ID
        - interval: (Int) heartbeat interval

- READY: 
    - Sent by the server after a successful login using opcode 2
    - Fields: 
        - token: (String) User token
        - available_professionals: (Dictionary<String:String>) Contains a array of professional user objects
