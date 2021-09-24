<template>
  <div>
    <div class="home">
      <h1>Welcome to your dashboard!</h1>
      <h4>This is where you will see all of the class and information.</h4>
        

      <button id="btn" class="create-course-btn" @click="$router.push('course-creation')">Create a course</button>
      <button id="btn" class="create-curricula-btn" @click="$router.push('curricula-creation')">Create Curricula</button>
      <br>
      <view-courses />

    </div>
  </div>
</template>

<script>  
import ViewCourses from '../components/ViewCourses.vue';

export default {
  name: "home",
  components: {
    ViewCourses
    
  },
};
</script>

<style>

</style>
