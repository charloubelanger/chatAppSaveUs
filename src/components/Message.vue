<template>
	<div>
		<h4>
			<slot></slot>
		</h4>
	</div>
</template>
<script>

export default {
  name: 'message',
}

</script>
<style scoped>
div {
background: white;
color: black;
	display: flex;
	align-items: center;
	border-radius: 23px;
	padding: 5px;
	margin-bottom: 12px;
	box-sizing: content-box;
}

</style>