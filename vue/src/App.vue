<template>
  <div>
    <the-header></the-header>
    <div id="app" class="app">
      <router-view />
    </div>
    <the-footer></the-footer>
  </div>
</template>

<script>
  import TheHeader from '@/components/TheHeader.vue';
  import TheFooter from '@/components/TheFooter.vue';

export default {
  name: "app",
  components: {
    TheHeader,
    TheFooter
  }
}
</script>

<style scoped>
#app {
  display: flex;
  align-items: center;
  flex-direction: column;
  background: rgba(33, 158, 188, 0.1);
  width: 100%;
  height: 100vh;
}

.nav-text {
  display: flex;
  justify-content: space-evenly;
  font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  margin: 5px;
}

.logo {
  display: flex;
}

h4 {
  font-family: Georgia, 'Times New Roman', Times, serif;
}
</style>