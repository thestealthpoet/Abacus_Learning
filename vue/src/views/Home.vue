<template>
  <div>
    <div class="home">
      <h1>Welcome to your dashboard!</h1>
      <h4>This is where you will see all of the class and information.</h4>
        
      <div class="options">
        <button id="btn" class="create-course-btn" @click="$router.push({ name: 'course-creation' })">Create a course</button>
        <button id="btn" class="create-curricula-btn" @click="$router.push({ name: 'curricula-creation' })">Create Curricula</button>
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'course-list' })">View All Available Courses on Abacus</button>
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'my-courses' })">My Courses</button>
        <button id="btn" class="create-assignment-btn">Add assignment</button>
        <br>
      </div>
      
      
      

    </div>
  </div>
</template>

<script>  



export default {
  name: "home",
  components: {
    
    
    
  },
};
</script>

<style>
.options {
  display: flex;
  flex-direction: column;
  gap: 15px;
  padding: 2px;
}
</style>
