<template>
  <div class="main">
      <div class="assignments-user-course">
          <div class="assignments" v-for="assignment in userAssignments" :key="assignment.id" >
            <div class="assignment-name">
                Assignment Name: {{assignment.assignmentName}}
            </div>
            <div class="assignment-due-date">
                Assignment Due Date: {{assignment.dueDate}}
            </div>
            <div class="assignment-type">
                Assignment Type: {{assignment.assignmentType}}
            </div>
          </div>
      </div>
  </div>
</template>

<script>
import assignmentService from "../services/AssignmentService";
export default {
    name: 'assignments-user-course',
    data() {
        return {
            assignments:  [],
            
    };
    },
    created() {
        assignmentService.getAssignmentsByUser(this.currentUserId, this.courseId)
        .then( (userAssignmentCourseData) => {
            this.userAssignmentCourse = userAssignmentCourseData.data;
        })
        .catch( (error) => {
            console.error(error + "user courses not loaded");
        });

        
        
    },

}
</script>

<style>

</style>