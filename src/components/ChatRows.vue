<template>
	<div>
		<h4>Conversations</h4>
		<section>
		<ChatRow v-for="chat in chats" :key='chat'>
					<article>
				<img src="../assets/yellowy1.jpg" width="60" height="60">
			</article>
		</ChatRow>
	</section>
	</div>
</template>
<script>
import ChatRow from "./ChatRow"

export default {
  name: 'ChatRows',
  data() {
  	return {
  		chats: ["Conv 1","Conv 2", "Conv 3", "Conv 4"]
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
		justify-content: center;
		flex-direction: column;
}
h3{
	padding-left: 12px;
	font-size: 16px;
}
h4{
	padding-top: 12px;
}
div {
	margin: auto;
	padding: 0px;
	background: #101010;
}
img {
	border-radius: 12px;
}
section{
	  display: grid;
	  grid-template-columns: repeat(auto-fit, 100px) ;
	   grid-template-rows: 100px;
  grid-gap: 5px;
  overflow-y: scroll;
  
}

</style>
