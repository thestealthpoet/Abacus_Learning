<template>
  <form v-on:submit.prevent="saveTopic" class="topic-creation-form">
    <div class="field">
      <label for="topic-title">Topic Title</label>
      <input type="text"
      v-bind:class="{'needs-content': topicName==='' }"
      required
      v-model.trim="topic.topicName"/>
    </div>
    <div class="field">
        <label for="description">Topic Description</label>
        <textarea id="description"
        v-model="topic.topicDescription" />
    </div>
    <div class="field">
      <label for="datetime-due">Due Date for Exercise</label>
      <input type="datetime-local"
      v-bind:class="{'needs-content': exercisesDate==='' }"
      required
      v-model="topic.topicDueDate"/> 
    </div>
    <div class="field">
      <label for="teach-date">Optional Topic Teach Date</label>
      <input type="datetime-local"
      v-model="teachDate"/>
    </div> 
    <button id="btn" class="btn btn-submit">Submit</button>
    </form>


</template>

<script>
import topicService from "../services/TopicService";

export default {
    name: "create-topic",
    data() {
        return {
            topic: {
                courseId: '',
                topicName: '',
                description: '',
                topicDueDate: '',
                topicTeachDate: '',
            },
            errorMsg: ''
        };
    },
    methods: {
        saveTopic() {
            topicService.createTopic(this.topic)
            .then(response => {
                if (response.status === 201) {
                    topicService.listTopics().then(response => {
                        this.$store.commit("", response.data);
                    });
                    this.topic = {
                        courseId: '',
                        name: '',
                        description: '',
                        dueDate: '',
                        teachDate: ''
                    }
                    this.$router.push('/topics');
                }
            }).catch(error => {
                this.errorMsg = error.response.statusText;
            });
        },
    },
}
</script>

<style>

.course-creation-form{
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

.needs-content {
    background-color: #FBAC0E;
}
</style>