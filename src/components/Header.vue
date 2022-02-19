<template>
	<div>
		<article>
		<img src="" width="60" height="60">
		<h2>
			UserName
			</h2>
		</article>
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
}
div {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 80px;
	background: black;
	color: whitesmoke;
	padding: 16px;
}
img {
	border-radius: 12px;
}
h2 {
	font-size:  32px;
}


</style>