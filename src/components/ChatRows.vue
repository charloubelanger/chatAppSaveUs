<template>
	<div>
		<h4>Ongoing conversations</h4>
		<ChatRow v-for="chat in chats" :key='chat'>
					<article>
				<img src="" width="50" height="50">{{ chat }}
			</article>
		</ChatRow>
	</div>
</template>
<script>
import ChatRow from "./ChatRow"

export default {
  name: 'ChatRows',
  data() {
  	return {
  		chats: ["Conversation 1","Conversation 2", "Conversation 3"]
  	}
  },
  components: {
  	ChatRow
  },
}
</script>
<style scoped>
		article{
	display: flex;
		align-items: center;
		gap:  5px;
}
div {
	width:  100%;
	height: 100%;
	padding: 15px;
	border-radius: 23px;
	box-sizing: border-box;
}

</style>