<template>
  <div id="app">
    <div id="nav">
      <div class="logo">
        <img src="@/assets/logo.png" alt="Abacus Logo">
      </div>
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#app {
  font-family: -apple-system, Roboto, 'Open Sans', sans-serif;
}
</style>