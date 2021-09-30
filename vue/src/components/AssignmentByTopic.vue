<template>
    <div class="main">
        
        <div class="view-assignments" v-for="assignment in assignments" :key="assignment.id">
            <div>Assignment Name: {{assignment.assignmentName}}</div>

            <div>Assignment Type: {{assignment.assignmentType}}</div>
            <div>Assignment Due Date: {{assignment.dueDate}}</div>
        </div>
    </div>
</template>
<script>
import assignmentService from "../services/AssignmentService";
export default {
    name: 'view-assignments',
    data() {
        return {
            assignments: [],
        };
    },
    created() {
        assignmentService.assignmentsByTopic()
        .then((assignmentsData) => {
            this.assignments = assignmentsData.data;
        })
        .catch((error) => {
            console.error(error + " all topics not able to be loaded");
        });
    },
    
};
</script>


<style>

</style>