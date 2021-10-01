<template>
  <div>
    <div class="home">
      <div class="greeting">
        <h1>Welcome to Abacus, {{$store.state.user.username}}!</h1>
        <!-- <center><h4>Get learning below!</h4></center> -->
        <center><h4>Let's get learning!</h4></center>
      </div>  
      <div class="options">
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'my-courses' })">My Courses</button>
        <button id="btn" class="create-course-btn" @click="$router.push({ name: 'course-creation' })">Create a course</button>
    
        <button id="btn" class="view-all-courses-btn" @click="$router.push( {name: 'course-list' })">View All Available Courses on Abacus</button>
        <button id="btn" class="view-assignment-btn" @click="$router.push( {name: 'assignments-user' })">My Assignments</button>

        <button id="btn" class="course-progress-btn" @click="$router.push( {name: 'course-progress' })">Course Progress</button>
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
/*original formatting*/
/* .options {
  display: flex;
  flex-direction: column;
  gap: 15px;
  padding: 2px;
}

.home {
  padding-top: 40px;
} */

/*sidebar formatting*/
.options {
  display: flex;
  flex-direction: column;
  gap: 15px;
  padding: 0px 140px 0px 10px;
  grid-area: bar;
}
.greeting {
  grid-area: greeting;
  justify-content: center;
  /* color: rgb(0, 48, 73) */
}
.home {
  padding-top: 40px;
  display: grid;
  grid-template-rows: 1fr 2fr;
  grid-template-areas: 
  "bar ."
  "bar greeting"
  "bar ."
  "bar .";
}

</style>
