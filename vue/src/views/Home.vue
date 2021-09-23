<template>
  <div class="home">
    
    <h1>Welcome to your dashboard!</h1>
    <h4>This is where you will see all of the class and information.</h4>
    
      <button class="create-course-btn" @click="$router.push('course-creation')">Create a course</button>
      <button class="create-curricula-btn" @click="$router.push('curricula-creation')">Create Curricula</button>

    
  </div>
</template>

<script>



export default {
  name: "home",
  components: {
    

  },
};
</script>
