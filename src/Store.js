import Vuex from "vuex";

export default new Vuex.Store({
  state: {
      session_id: "",
      username: "",
      connection: null,
      token: ""
  },
  mutations: {
 Connect (state) {
      state.connection = new WebSocket("ws://165.227.107.161:8080/gateway")
    state.connection.onopen = function(event) {
      console.log(event)
    }
     state.connection.onmessage = function(event) {
      console.log(event.data)
       state.session_id = JSON.parse(event.data).session_id
    }
    },
    GuestAuth (state) {
      let user_USERNAME = "Candy"
      state.username = user_USERNAME
      state.connection.send(JSON.stringify({"op":2,"d":{"username":`${user_USERNAME}`,"age":100}}))
       state.connection.onmessage = function(event) {
      state.token = JSON.parse(event.data).token
     }
    }
   
  },
  actions: {
  setConnection(context) {
      context.commit('Connect')
    },
  auth2(context) {
      context.commit('GuestAuth')
    }
  },
  modules: {

  }
})