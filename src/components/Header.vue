<template>
	<div>
		<article>
		<img src="" width="60" height="60">
		<h2>
			{{ username }}
			</h2>
		</article>
		<nav>
			<ul>
			<li @click="Connect">
					<a id="guest" href="#">
						Continue as Anonymous
					</a>
				</li>
				<li>
					<a href="#">
						Switch to Professional
					</a>
				</li>
				<li>
					<a href="#">
						Support
					</a>
				</li>
			</ul>
		</nav>
	</div>
</template>
<script>
import store from '@/Store.js';

export default {
  name: 'Header',
  data(){
  	return{
  		username: "Guest"
  	}
  },
  methods: {
  	Connect() {
  		store.dispatch('auth2')
  	}
  }
}
</script>
<style scoped>
	article{
	display: flex;
		align-items: center;
		gap:  5px;
		border-radius: 24px;
		width: 25vw;
		padding: 0 25px ;
		background: linear-gradient(
  45deg,
 rgba(60,79,255, 1),
 rgba(0,191,255, 1)
);
}
div {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 80px;
	background: black;
	color: whitesmoke;
	padding: 25px;
}
img {
	border-radius: 12px;
}
h2 {
	font-size:  28px;
	margin-left:25px;
}

nav li {
	display: inline;
	margin: 15px;
}

a {
	text-decoration: none;
	color: white;
	font-size: 18px;
}
#guest {
	color: rgba(60,79,255, 1);
}
</style>