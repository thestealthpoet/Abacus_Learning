<template>
  <div>
    <div class="home">
      <h1>Welcome to Abacus, {{$store.state.user.username}}</h1>
      <center><h4>Get learning below!</h4></center>
      <!-- <h4>Let's learn something new, this.user.id.</h4> -->
        
      <div class="options">
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'my-courses' })">My Courses</button>
        <button id="btn" class="create-course-btn" @click="$router.push({ name: 'course-creation' })">Create a course</button>
    
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'course-list' })">View All Available Courses on Abacus</button>
        
        <button id="btn" class="course-progress-btn" @click="$router.push( {name: 'course-progress' })">Course Progress</button>
        
        <button id="btn" class="view-assignment-btn" @click="$router.push( {name: 'assignments-user' })">My Assignments</button>
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
