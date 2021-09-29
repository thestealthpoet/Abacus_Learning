<template>
  <div class = "create-curricula">
      <create-topic v-bind:selectedCourseId="$store.state.selectedCourseId"/>
      <create-assignment/>
  </div>
</template>

<script>
import createTopic from '../components/CreateTopic.vue';

export default {
    components: 
    {createTopic
  }
    

}
</script>

<style>
  .create-curricula {
    display: flex;
    align-items: flex-start;
  }
</style>