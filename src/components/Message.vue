<template>
	<div>
		<h4>
			<slot></slot>
		</h4>
		<element>X</element>
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
element{
	position: absolute;
	font-size: 32px;
	padding: 12px;
	border-radius: 25%;
	border: 2px whitesmoke solid;
	.background: blue;
}
</style>