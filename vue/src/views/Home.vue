<template>
  <div>
    <div class="home">
      <h1>Welcome to your dashboard!</h1>
      <h4>This is where you will see all of the class and information.</h4>
<<<<<<< HEAD
      <button class="create-course-btn" @click="$router.push('course-creation')">Create a course</button>
      <button class="create-curricula-btn" @click="$router.push('curricula-creation')">Create Curricula</button>
      <view-courses />
=======
      <button id="btn" class="create-course-btn" @click="$router.push('course-creation')">Create a course</button>
      <button id="btn" class="create-curricula-btn" @click="$router.push('curricula-creation')">Create Curricula</button>
>>>>>>> a8c5d8c552a9af84c6582ef918a12f4b0717bc88
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
