<template>
    <header class="header">
        <div>
            <img class="logo" src="@/assets/logo.png" alt="Abacus Logo">
        </div>
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
    height: 18vh;
    background: rgba(0, 48, 73, .7);


}
</style>