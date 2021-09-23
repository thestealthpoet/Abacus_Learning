<template>
  <div>
    <the-header></the-header>
    <div class="home">
      <h1>Welcome to your dashboard!</h1>
      <h4>This is where you will see all of the class and information.</h4>
      <button class="create-course-btn" @click="$router.push('course-creation')">Create a course</button>
      <button class="create-curricula-btn" @click="$router.push('curricula-creation')">Create Curricula</button>
    </div>
    <the-footer></the-footer>
  </div>
</template>

<script>  
  import TheHeader from '../components/TheHeader.vue';
  import TheFooter from '../components/TheFooter.vue';


export default {
  name: "home",
  components: {
    TheHeader,
    TheFooter
  },
};
</script>

<style>
.home {
}
</style>
