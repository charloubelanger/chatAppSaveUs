import Vuex from "vuex";

export default new Vuex.Store({
  state: {
    session_id: "",
    username: "",
    connection: null,
    token: "",
    messages: []
  },
  mutations: {
    Connect(state) {
    },
    GuestAuth(state) {
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