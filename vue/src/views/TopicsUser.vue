<template>
<div class="todo">
  <div class="user-topics">
      <user-topics />
      <div class="assignments">
      <user-assignments/>
      </div>
  </div>
</div>  
</template>

<script>
import userAssignments from '../components/UserAssignments.vue';
import userTopics from '../components/UserTopics.vue';
export default {
    components: { 
        userTopics,
        userAssignments

    },

}
</script>

<style>
.todo {
    
    grid-template-columns: 25%, 25%;
    grid-template-rows: auto;
    grid-template-areas:
    "topics assignments";

}
.user-topics {
    grid-area: topics;
}
.assignments {
    grid-area: assignments;
}

</style>