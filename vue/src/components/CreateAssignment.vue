<template>
  <form v-on:submit.prevent="saveAssignment" class="assignment-creation-form">
  <div class="field">
      <label for="topic-names"> Choose a topic name: </label>
         <select name="topic-names" id="topic-names" v-model="assignment">
             <option v-for="topic in topics" :key="topic.id" v-bind:value="{
                 topicId: topic.topicId, 
                 
             }">
             {{topic.topicName}}
             </option>
             </select>
    </div>
    <div class="field">
      <label for="assignment-name">Assignment Name</label>
      <input type="text"
      required
      v-model.trim="assignment.assignmentName"/>
    </div>
    <div class="field">
      <label for="datetime-due-date">Due Date for Assignment</label>
      <input type="datetime-local"
      v-model="assignment.dueDate"/> 
    </div>
    <div class="field">
      <label for="assignment-type">Assignment Type</label>
      <input type="text"
      v-model.trim="assignment.assignmentType"/>
    </div>
    <button id="btn" class="btn btn-submit">Add Assignment</button>
    </form>


</template>

<script>
import assignmentService from "../services/AssignmentService";
import topicService from "../services/TopicService";
export default {
    name: "create-assignment",
    data() {
        return {
            assignment: [],

            topics: [],
        };    
    },
    methods: {
        saveAssignment() {
            assignmentService.createAssignment(this.assignment)
            .then(response => {
                if (response.status === 201) {
                    assignmentService.listAssignments().then(response => {
                        this.$store.commit("", response.data);
                    });
                    this.assignment = {
                        topicId: '',
                        assignmentName: '',
                        dueDate: '',
                        assignmentType: ''

                    }
                    this.$router.push({name: 'myDashboard'});
                }
            }).catch(error => {
                this.errorMsg = error.response.statusText;
            });
        },
    
    },
    created() {
        topicService.listTopics()
        .then((topicData) => {
            this.topics = topicData.data;
        })
        .catch(error =>{
            console.error(error + 'data could not be loaded')
        });
    }
}
</script>

<style>

.assignment-creation-form{
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

</style>