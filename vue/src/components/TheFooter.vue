<template>
    <footer class="footer">
        <div>
            <ul class="footer-list">
                <li class="footer-item">
                    <router-link class="footer-link" v-bind:to="{ name: 'home' }">Home</router-link>
                </li>
                <li class="footer-item">Services</li>
                <li class="footer-item">
                    <router-link class="footer-link" v-bind:to="{ name: 'about' }">About</router-link>
                </li>
                <li class="footer-item">Terms</li>
                <li class="footer-item">
                    <router-link class="footer-link" v-bind:to="{ name: 'PrivacyPolicy' }">Privacy Policy</router-link>
                </li>
            </ul>
            <p>ABACUS &#xa9; 2021</p>
        </div>
    </footer>
</template>

<script>
export default {
    name: 'Footer',
}
</script>

<style>
.footer {
    font-family: Georgia, sans-serif;
    /* background: rgba(0, 48, 73, .7); */
    background: linear-gradient(to left, rgba(0, 48,73), rgba(33, 158, 188));
    /* min-height: 10vh; */
    height: 8vh;
    padding: 40px 0;
}

p {
    display: flex;
    justify-content: center;
    color: white;
}

ul {
    display: flex;
    justify-content: center;
    padding:0;
    list-style:none;
    text-align:center;
    font-size: 16px;
    line-height:1.6;
    margin-bottom:0;
    color: white;
}

li {
  padding:0 10px;
  text-decoration: none;
}

.footer-link {
    text-decoration: none;
}
</style>