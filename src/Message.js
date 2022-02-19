export default class {
    constructor(content, user, user_id) {
        this.id = "";
        this.user_id = "";
        this.author = {"age": 0, "username": user}
        this.content = content;
        this.timeCreated = Date.now();
        this.attachements = []
    }
}