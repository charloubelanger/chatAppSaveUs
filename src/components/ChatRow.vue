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
	background: rgba(20, 20, 20, 1.0);
	display: flex;
	align-items: center;
	max-height: 8vh;
	border-radius: 12px;
	padding: 5px;
	margin-bottom: 12px;
	box-sizing: border-box;
	overflow: hidden;
}

</style>