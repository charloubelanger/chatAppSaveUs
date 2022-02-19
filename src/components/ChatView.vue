<template>
	<div class="chatView">
	<section class="messageView">
		<div class="titleView">
			<h2>This is a conversation</h2>
		</div>
		<Message v-for="message in messages" :key="message" class="message">
			{{message}}
		</Message>
	</section>
	<section class="messageBar">
		 <textarea></textarea>
		 <button>
		 	<h4>Send</h4>
		 </button>
	</section>
	</div>
</template>
<script>
import Message from "./Message"

export default {
  name: 'ChatView',
  data() {
  	return {
  		messages: ["Hey", "Hi", "How are you^"]
  	}
  },
  components: {
  	Message
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
	border: 1px solid grey;
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