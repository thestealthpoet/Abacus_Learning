<template>
  <form v-on:submit.prevent class="curricula-creation-form">
    <div class="field">
      <label for="topic-title">Topic Title</label>
      <input type="text"
      v-model="topic"/>
    </div>
    <div class="field">
      <label for="due-date">Due Date for Exercise</label>
      <input type="date"
      v-model="exercisesDate"/>
    </div>  
    <div class="field">
      <label for="description"> Optional Description </label>
      <textarea
      id="optional-description"
      rows="3"
      v-model="description"/>
    </div>     
  </form>  
</template>

<script>
export default {
  name: "create-curricula",
  data() {
    return {
      topic: '',
      topicName: '',
      exercisesDate: '',
      addedContent: '',
      teachDate: '',
      homework: '',
      quiz: ''
    }
  }

}
</script>

<style>
.curricula-creation-form{
    display: inline-grid;
    height: 45vh;
    width: 35vw;
    border: 3px solid #219EBC;
    border-radius: 3px;
    padding: 10px;
}
.field{
    display: flex;
    flex-direction: column;
    justify-self: stretch;
}

</style>