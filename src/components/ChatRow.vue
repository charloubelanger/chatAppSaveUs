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
	display: flex;
	align-items: center;
	border-radius: 12px;
	padding: 5px;
	margin-bottom: 12px;
	box-sizing: border-box;
	overflow: hidden;
}

</style>
