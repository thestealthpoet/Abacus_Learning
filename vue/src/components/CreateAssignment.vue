<template>
  <form v-on:submit.prevent="saveAssignment" class="assignment-creation-form">
    <div class="field">
      <label for="topic-id">Topic Id</label>
      <input type="text"
      v-model.trim="assignment.topicId"/>
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

export default {
    name: "create-assignment",
    data() {
        return {
            assignment: {
                topic_id: '',
                assignment_name: '',
                due_date: '',
                assignment_type: '',
            },
            errorMsg: ''
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