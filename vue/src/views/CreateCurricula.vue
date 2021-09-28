<template>
  <div class = "create-curricula">
      <create-topic v-bind:selectedCourseId="$store.state.selectedCourseId"/>
      <create-assignment/>
  </div>
</template>

<script>
import createTopic from '../components/CreateTopic.vue';
import createAssignment from '../components/CreateAssignment'
export default {
    components: 
    {createTopic,
    createAssignment}
    

}
</script>

<style>
  .create-curricula {
    display: flex;
    align-items: flex-start;
  }
</style>