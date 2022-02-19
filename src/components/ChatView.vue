<template>
	<div class="chatView">
	<section class="messageView">
		<div class="titleView">
			<h2>This is a conversation</h2>
		</div>
		<hr>
		<Message v-for="message in messages" :key="message" class="message">
		Hey
		</Message>
	</section>
	<section class="messageBar">
		 <textarea v-model="message" placeholder="Ecrivez un message" ></textarea>
		 <button @click='sendMessage("Hey")'>
		 	<h4>Send</h4>
		 </button>
	</section>
	</div>
</template>
<script>
import Message from "./Message"
//import uuidv4 from "uuid/v4"
import axios from 'axios'
import store from "@/Store"

export default {
  name: 'ChatView',
  data() {
  	return {
  		messages: [],
  		message: "",
  	
  	}
  },
  components: {
  	Message
  },
  methods: {
  	sendMessage(message) {
 			 	console.log(message)
  	},
  	async load() {
  		await store.dispatch('setConnection')
  		const {
  			data: { messages }
  		} = await axios.get(`http://${store.session_id}/messages`, {
  			header: {
  				'Authorization' : `${store.token}`
  			}
  		});
  		this.messages = messages
  			console.log(messages)
  	}
  },
  beforeMount() {

 		this.load()

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
	background: rgb(10, 10, 10);
border:  none;
	background: transparent;
	box-sizing: border-box;
	resize: none;
	outline: none;
}

.messageBar {
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
height: 20%;
	width:  100%;
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