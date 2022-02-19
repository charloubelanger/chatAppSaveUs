<template>
	<div class="homeView">
		<Header />
	<section class="main">
	<element>
		<Board />
		<ChatRows />
	</element>
	<element>
		<ChatView />
	</element>
	</section>
	</div>
</template>
<script>
	import Header from '../components/Header.vue'
	import ChatRows from '../components/ChatRows.vue'
	import ChatView from '../components/ChatView.vue'
	import Board from '../components/Board.vue'

export default {
  name: 'Home',
  components: {
    Header, 
    ChatRows,
    ChatView,
    Board
  }
}
</script>
<style scoped>
.homeView {
	padding: 0;
	margin: 0;
	height: 100%;
	overflow: hidden;
	box-sizing: border-box;
}
.main {
	display:  flex;
	width:  100vw;
	height: 100%;
	padding: 12px;
	box-sizing: border-box;
	flex-grow: 1;
	gap:  12px;
}
.main element:nth-child(1) {
	flex-grow: 1;
}
.main element:nth-child(2) {
	flex-grow: 5;

}
element{
	box-sizing: border-box;
}
</style>