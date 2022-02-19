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
	background: rgba(10,10,10,1);
box-shadow:  2px 2px 20px rgba(8,8,8,1),
             -2px -2px 20px rgba(5,5,5,1);
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