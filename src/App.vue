<template>
  <Home />
</template>

<script>
import Home from './views/Home.vue'

export default {
  name: 'App',
  components: {
    Home
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  height: 100vh;
  box-sizing: border-box;

}
h1 {}
h2{
  font-size: 24px;
  color: whitesmoke;
}
h3{
  font-size: 18px;
  color: gray;
}
h4 {
   color: rgb(60, 79, 255);
}

</style>
