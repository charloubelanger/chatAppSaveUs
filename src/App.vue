<template>
  <Home />
</template>

<script>
import Home from './views/Home.vue'
import store from './Store'
export default {
  name: 'App',
  components: {
    Home
  },
  data() {
    return {
      connection: null
    }
  },
  created() {
   store.dispatch('setConnection')
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

::-webkit-scrollbar {
   width: 15px;
}

::-webkit-scrollbar-track {
   background: #111111; 
}

::-webkit-scrollbar-thumb {
   background: #555555; 
}

::-webkit-scrollbar-thumb:hover {
   background: #555555; 
}::-webkit-scrollbar {
   width: 10px;
}

</style>
