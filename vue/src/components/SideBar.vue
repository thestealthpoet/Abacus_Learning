<template>
    <div>
        <ul class="sidebar">
            <li>
                Home
            </li>
            <li>
                <router-link v-bind:to="{ name: 'myDashboard', params: {username: this.$store.state.user.username} }">
                    <img src="@/assets/dashboard.png" alt="Dashboard">
                </router-link>
            </li>
            <li>
                <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">
                    <img src="@/assets/logOutIcon.png" alt="Logout">Logout
                </router-link>
            </li>
            <li>
                Settings
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: 'SideBar',
}
</script>

<style>

</style>