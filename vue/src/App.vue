<template>
  <div id="app">
    <div>
        <img class="logo" src="@/assets/logo.png" alt="Abacus Logo">
      </div>
    <div id="nav">
      <div>
        <h4>Always gaining knowledge</h4>
      </div>
      <div class="nav-text">
      <router-link v-bind:to="{ name: 'home' }">
        <img src="@/assets/homeIcon.png" alt="Home">
      </router-link>
      <router-link v-bind:to="{ name: 'About' }">
        <img src="@/assets/infoIcon.png" alt="About">
      </router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">
        <img src="@/assets/logOutIcon.png" alt="Logout">
      </router-link>
      </div>
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