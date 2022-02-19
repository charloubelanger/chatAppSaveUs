<template>
	<div class="chatView">
	<section class="messageView">
		<div class="titleView">
			<h2>This is a conversation</h2>
		</div>
		<Message v-for="message in messages" :key="message" class="message">
			{{message.d.username}}
		</Message>
	</section>
	<section class="messageBar">
		 <textarea v-model="message" placeholder="Ecrivez un message" ></textarea>
		 <button @click='sendMessage({"op":2,"d":{"username":"Username","age":100}} )'>
		 	<h4>Send</h4>
		 </button>
	</section>
	</div>
</template>
<script>
import Message from "./Message"
//import uuidv4 from "uuid/v4"
import axios from "axios";

export default {
  name: 'ChatView',
  data() {
  	return {
  		messages: [],
  		message: "",
  		connection: null,
  		session_id: ""
  	}
  },
  components: {
  	Message
  },
  methods: {
  	sendMessage(message) {
  		console.log(this.connection)
  		this.connection.send(message)
  		console.log(message)

  	},
  	async load() {
    		const {
    			data: { messages }
    		} = await axios.get(`http://165.227.107.161:8080/${self.session_id}/messages`, {
      	headers: {
      		'Authorization' : 'B1B7E320-2EA9-4231-85B5-59F27FFB66471645244174'
      	}
      });
    		this.messages = messages
    },
  },

 	created() {
 		this.connection = new WebSocket("ws://165.227.107.161:8080/gateway")

 		this.connection.onopen = function(event) {
 			//var userID = uuidv4(); 
 			console.log(event)
 			console.log("Successfully connected")
 		}
 		this.connection.onmessage = function(event) {
 			self.session_id = event.data.session_id
 			console.log(event.data)
 		}
 	}
  }

</script>
<style scoped>

textarea {
	width:  100%;
	height: 4vh;
	margin: 12px;
	padding: 8px;
	color: grey;
	border: 1px solid rgba(55, 0, 211, 1.0);
	border-radius: 8px;
	background: transparent;
	box-sizing: border-box;
	resize: none;
}

.messageBar {
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
height: 20%;
width: 80%;
margin: auto;
box-sizing: border-box;
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
			overflow-y:  scroll;
	box-sizing: border-box;
}
.titleView {
	color: white;
	text-align: left;
	height: 60px;
}
button {
	color: grey;
	background: none;
	border: none;
	padding: 3px;
}


</style>