<template>
	<div>
		<article>
		<img src="" width="60" height="60">
		<h2>
			UserName
			</h2>
		</article>
		<nav>
			<ul>
				<li>
					<a href="#">
						Professional Log In
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

export default {
  name: 'Header'
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
</style>