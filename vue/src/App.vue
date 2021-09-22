<template>
  <div id="app">
    <div id="nav">
      <div class="logo">
        <img src="@/assets/logo.png" alt="Abacus Logo">
      </div>
      <router-link v-bind:to="{ name: 'home' }">
        <img class="HomeIcon" src="@/assets/homeIcon.png" alt="Home">
      </router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">
        <img src="@/assets/logOutIcon.png" alt="Logout">
      </router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#app {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  display: flex;
  align-items: center;
  flex-direction: column;
  background: rgba(33, 158, 188, 0.1);
}

.HomeIcon {
  
}

</style>