<template>
  <div class="body">
    <the-header></the-header>
    <div id="app" class="app">
      <router-view/>
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

<style>
#app {
  display: flex;
  align-items: center;
  flex-direction: column;
  background: rgba(33, 158, 188, 0.1);
  width: 100%;
  height: 100vh;
}
#btn {
  background-color: rgba(251, 172, 14, .5);
  border: 2px solid rgba(251, 172, 14, 1);
  color: white;
  padding: 11px 22px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 8px;
}
#btn:hover {
  background-color: rgba(251, 172, 14, 1);
}
</style>