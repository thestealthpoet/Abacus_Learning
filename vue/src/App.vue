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

<style>
#app {
  display: flex;
  align-items: center;
  flex-direction: column;
  background: rgba(33, 158, 188, 0.1);
  width: 100%;
  height: 100%;
  min-height: 80vh;
  font-family: Georgia, sans-serif;
}

#btn {
  background-color: rgba(251, 172, 14, 1);
  border: 2px solid rgba(251, 172, 14, 1);
  color: white;
  padding: 11px 11px 11px 24px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  border-radius: 14px;
  box-shadow: 0 10px 20px -8px rgba(0, 0, 0,.7);
  cursor: pointer;
  position: relative;
  transition: 0.5s;
}

#btn:hover {
  background-color: rgba(251, 172, 14, .6);
  padding-right: 24px;
  padding-left:8px;
}

#btn:after {
  content: ' »';
  position: center;
  opacity: 0;  
  top: 14px;
  right: -20px;
  transition: 0.5s;
}
#btn:hover:after {
  opacity: 1;
  right: 10px;
}
</style>