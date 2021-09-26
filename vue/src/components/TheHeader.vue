<template>
    <header class="header">
        <div>
            <img class="logo" src="@/assets/logo3.png" alt="Abacus Logo">
        </div>
        <div class="phrase">
            <h4>Always gaining knowledge!</h4>
        </div>
        <div class="nav-text">
        <router-link v-bind:to="{ name: 'myDashboard', params: {username: this.$store.state.user.username} }">
            <img src="@/assets/homeIcon.png" alt="Home">
        </router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">
            <img src="@/assets/logOutIcon.png" alt="Logout">
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
    height: 16vh;
    /* background: rgba(0, 48, 73, .7); */
    background: linear-gradient(to right, rgba(0, 48,73, .9), rgba(33, 158, 188));
}

.nav-text {
  justify-content: flex-end;
  font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  margin: 5px;
}

.logo {
  display: flex;
}

.phrase {
    font-size: 25px;
    /* color: white; */
}

h4 {
  font-family: Georgia, 'Times New Roman', Times, serif;
}
</style>