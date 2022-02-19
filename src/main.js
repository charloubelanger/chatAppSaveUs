import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import Vuex from "vuex";
import store from './Store'

function createSocket(username, age) {
    // create new websocket for url ws://api.evelyn.red:8080/gateway
    const ws = new WebSocket('ws://165.227.107.161:8080/gateway');

    console.log(ws);

    // run code on ws open
    ws.onopen = function (event) {
        console.log('connected');
    };

    // run code on receive of websocket message
    ws.onmessage = function (event) {
        // serialize as json
        const data = event.data
        let json = JSON.parse(data);
        console.log(json);
        console.log("a");
        // if data has interval, run code
        console.log(json.interval);
        if (json.interval != null) {
            console.log("b");
            // get session id from json
            const sessionId = json.session_id;
            // send packet with username and age
            const packet = {
                "op": 2,
                "d": {
                    "username": username,
                    "age": age
                }
            }
            console.log(packet);
            // send packet to websocket
            console.log(JSON.stringify(packet));
            ws.send(JSON.stringify(packet));
            store.state.session_id = sessionId;
        }
        if (json.t) {
            console.log(json.t);
            switch (json.t) {
                case 'READY':
                    // get token from json
                    const token = json.token;
                    // get available_professionals from json
                    const available_professionals = json.available_professionals;
                    console.log(available_professionals, token);
                    // save session id and token to store
                    store.state.token = token;
                    break;
                case 'MESSAGE_CREATE':
                    // get message from json d object
                    const message = json.d;
                    store.state.messages.push(message);
                    console.log(store.state.messages);
                    break;
                case 'MESSAGE_DELETE':
                    // get packet from json d object
                    const deletePacket = json.d;
                    break;
                default: break;
            }
        }
    };
}

createSocket("Christian", 13);

createApp(App).use(router).use(Vuex).mount('#app')
