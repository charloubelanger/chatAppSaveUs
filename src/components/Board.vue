<template>
	<div>
			<h4>Board of feelings</h4>
		<section>
		<article v-for="feel in feelings" :key="feel">
	<i class="material-icons">
{{feel.icon}}
</i>
		<h3>
			{{feel.category}}
			</h3>
		</article>
	</section>
	</div>
</template>
<script>

export default {
  name: 'Board',
  data() {
  	return {
  		feelings: [{category: "Danger", icon:"electric_bolt"},{category: "Harassment", icon:"visibility"}, {category: "Stress", icon:"track_changes"}, {category: "Fear", icon:"settings_accessibility"}]
  	}
  }
}
</script>
<style scoped>
	article{
	display: flex;
		align-items: center;
		flex-direction: column;
		gap:  5px;
}
div {
	background: black;
	color: whitesmoke;
	padding: 16px;
}
section{ 
	  display: grid; 
  grid-template-columns: 1fr 1fr; 
  grid-template-rows: 1fr 1fr; 
  gap: 4px;
 }
i {
	border-radius: 12px;
font-size: 50px;
}
h2 {
	font-size:  32px;
}


</style>