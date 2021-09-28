<template>
  <div class="main">
      <div class="assignments-list">
          <div class="assignments" v-for="assignment in userAssignments" :key="assignment.id" >
            <div class="assignment-name">
                Assignment Name: {{assignment.assignmentName}}
            </div>
            <div class="course-description">
                Assignment Type: {{assignment.assignmentType}}
            </div>
            <div class="class-time">
                Due Date: {{new Date(assignment.dueDate).toLocaleString()}}
            </div>
            </div>
      </div>
  </div>
</template>

<script>
import assignmentService from "../services/AssignmentService";
export default {
    name: 'user-assignments',
    data() {
        return {
            //value of userCourses
            //key values are column name
            //modeling java
            //course.courseName equates to course.getName()
            userAssignments:  [],
            currentUserId: this.$store.state.user.id,
            //isTeacher: false,
    };
    },
    created() {
                                               //logged in store
        assignmentService.getAssignmentsByUser(this.currentUserId)
        //when you receive the data back as a list of course Object data
        //userCoursesData is a var
        //loaded into an array
        //values from db
        //don't have to define already defined columns
        .then( (userAssignmentData) => {
            this.userAssignments = userAssignmentData.data;
        })
        .catch( (error) => {
            console.error(error + "user assignments not loaded");
        });

        
        
    },

}
</script>

<style>
.assignments {
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  display: inline-flexbox;
  flex-wrap: wrap;
  flex-direction: row;
}

</style>