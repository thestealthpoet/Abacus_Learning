<template>
  <form v-on:submit.prevent class="curricula-creation-form">
    <div class="field">
      <label for="topic-title">Topic Title</label>
      <input type="text"
      v-bind:class="{'needs-content': topicName==='' }"
      required
      v-model.trim="topicName"/>
    </div>
    <div class="field">
      <label for="due-date">Due Date for Exercise</label>
      <input type="date"
      v-bind:class="{'needs-content': exercisesDate==='' }"
      required
      v-model="exercisesDate"/> 
    </div>
    <div class="field">
      <label for="teach-date">Optional Topic Teach Date</label>
      <input type="date"
      v-model="teachDate"/>
    </div>  
    <div class="field">
      <label for="description"> Optional Description </label>
      <textarea
      id="optional-description"
      rows="3"
      v-model.trim="description"/>
    </div>
    <div class="other">
      <input type="radio"
      id="homework"
      name="assignments"
      value="homework">
      <label for="homework">Add Homework?</label>
      <input type="radio"
      id="quiz"
      name="assignments"
      value="quiz">
      <label for="quiz">Add Quiz?</label>
    </div>  
    <div>
    <button id="btn" type="submit">Submit</button>
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
.curricula-creation-form {
    display: inline-grid;
    height: 45vh;
    width: 35vw;
    border: 3px solid #219EBC;
    border-radius: 3px;
    padding: 40px;
    margin: 80px;
}
.field{
    display: flex;
    flex-direction: column;
    justify-self: stretch;
}
/* .needs-content {
    background-color: #FBAC0E;
} */
.other {
  display: flex;
  justify-content: flex-end;
}

</style>