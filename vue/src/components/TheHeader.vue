<template>
    <header class="header">
        <div>
            <img class="logo" src="@/assets/whitelogo.png" alt="Abacus Logo">
        </div>
        <div class="phrase">
            <h4 class="headline">Always gaining knowledge!</h4>
        </div>
        <div class="nav-text">
        <router-link class="Icons" v-bind:to="{ name: 'myDashboard', params: {username: this.$store.state.user.username} }">
            <img src="@/assets/home2.png" alt="Home">Home
        </router-link>
        <router-link class="Icons" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">
            <img src="@/assets/logout2.png" alt="Logout">Logout
        </router-link>
        <router-link class="Icons" v-bind:to="{ name: 'settings' }" v-if="$store.state.token != ''">
            <img src="@/assets/settings2.png" alt="Settings">Settings
        </router-link>
        </div>
    </header>
</template>

<script>
export default {
    name: 'Header',
}
</script>

<style>
.header {
    display: flex;
    justify-content: space-between;
    height: 20vh;
    /* background: rgba(0, 48, 73, .7); */
    background: linear-gradient(to right, rgba(0, 48,73), rgba(33, 158, 188));
    font-family: Georgia, sans-serif;
}

.nav-text {
  display: flex;
  justify-content: flex-end;
  margin: 10px;
}

.logo {
  display: flex;
  padding: 10px 0px 10px 40px;
}

.phrase {
    font-size: 25px;
    font-family: Georgia, 'Times New Roman', Times, serif, cursive;
    text-shadow: 1px 1px 2px black;
    color: white;
}

.Icons {
    text-decoration: none;
    display: grid;
    text-align: center;
    padding: 5px 10px;
    color: white;
}
.Icons:hover {
    text-decoration: underline;
}
</style>