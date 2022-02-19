<template>
	<div>
		<h3>
			<slot></slot>
		</h3>
	</div>
</template>
<script>

export default {
  name: 'ChatRow',
}

</script>
<style scoped>
div {
	background: #171717;
box-shadow:  20px 20px 60px #141414,
             -20px -20px 60px #1a1a1a;
	display: flex;
	align-items: center;
	max-height: 8vh;
	border-radius: 12px;
	padding: 5px;
	margin-bottom: 24px;
	box-sizing: border-box;
	overflow: hidden;
}

</style>