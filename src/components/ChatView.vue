<template>
  <div class="chatView">
    <section class="messageView">
      <div class="titleView">
        <h2>Bienvenue</h2>
      </div>
      <div class="message messageColumn" v-for="message in messages" :key="message.content">
	  <div>
		<h4>{{message.author.username}} - {{message.author.age}} ans</h4>
		<p>{{message.content}}</p>
	  </div>
      </div>
      <hr />
    </section>
    <section class="messageBar">
      <textarea v-model="message" placeholder="Ecrivez un message"></textarea>
      <button @click="sendMessage()">
        <h4>Send</h4>
      </button>
    </section>
  </div>
</template>
<script>
import Message from "./Message";
//import uuidv4 from "uuid/v4"
import axios from "axios";
import store from "@/Store";

export default {
  name: "ChatView",
  computed: {
    messages() {
      return store.state.messages;
    },
  },
  methods: {
    sendMessage() {
      let config = {
        headers: {
          Authorization: store.state.token,
          content: this.message,
        },
      };
      axios
        .post(
          `https://api.evelyn.red/${store.state.session_id}/messages`,
          JSON.stringify({ message: this.message }),
          config
        )
        .then(
          (response) => {
            console.log(response);
          },
          (error) => {
            console.log(error);
          }
        );
    },
  },
};
</script>

<style scoped>
textarea {
  width: 100%;
  height: 4vh;
  margin: 12px;
  padding: 8px;
  color: grey;
  background: #222222;
  border: none;
  box-sizing: border-box;
  resize: none;
  outline: none;
}

.messageBar {
  display: flex;
  justify-content: space-around;
  align-items: flex-start;
  height: 20%;
  width: 100%;
  box-sizing: border-box;
  background: #050505;
}
.chatView {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
  border-radius: 23px;
  padding: 16px;
  box-sizing: border-box;
}

.messageView {
  display: flex;
  flex-direction: column;
  height: 80%;
  overflow-y: scroll;
  box-sizing: border-box;
}
.titleView {
  color: white;
  text-align: left;
  height: 60px;
  background: #070707;
}

.messageColumn {
  color: white;
  text-align: left;
  background: #070707;
}

button {
  color: grey;
  background: #222222;
  border: none;
  margin-top: 12px;
  margin-right: 5%;
  height: 4vh;
}
.alignLeft div {
    float: left;
    clear: none; 
}

</style>
