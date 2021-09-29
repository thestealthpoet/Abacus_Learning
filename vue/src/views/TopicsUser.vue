<template>
  <div class="user-topics">
      <user-topics />
      <user-assignments/>
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

</style>