<template>
	<div>
		<section>
			<h3>Email<h3>
			<input v-model="emailAddress" type="text" name="emailaddress">
		</section>
		<section>
			<h3>Password<h3>
			<input v-model="Password" type="Password" name="password">
		</section>
		<button>
			<p>Se connecter</p>
		</button>
	<div>
</template>
<script>
	export default {
		name: "LoginRegistration",
		data() {
			return {
				emailAddress: "",
				Password: ""
			}
		}
	}
</script>
<style>
	h3 {
		color:  white;
		padding: 5px;
		text-align: left;
	}
	div{
		position: absolute;
		z-index: 3;
		width: 350px;
		height: 275px;
		top: 50%;
		left:  50%;
		margin: -142.5px -175px;
		background: rgb(15, 15, 15);
		border-radius:  20;
		padding:  20px;
	}
	section{
		display: flex;
		gap:  3px;
		flex-direction: column;
	}
	button {
		background: black;
		width: 80%;
		height: 32px;
		border-radius:  12px;
		padding: 16px;
		color:  whitesmoke;
	}
	input {
		background: black;
		border:  none;
		outline: none;
		color: white;
	border-radius:  12px;
	}
</style>