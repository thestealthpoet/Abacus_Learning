<template>
  <div class="main">
      <div class="assignments-list">
          <div class="assignments" v-for="assignment in userAssignments" :key="assignment.id" >
            <div class="assignment-name">
                <h3> {{assignment.assignmentName}} </h3>
            </div>
            <div class="assignment-description">
                 <h4>{{assignment.assignmentType}}</h4>
            </div>
            <div class="class-time">
                Due {{dayNameAndTime(assignment.dueDate)}}
            </div>
            </div>
      </div>
  </div>
</template>

<script>
import moment from 'moment';
import assignmentService from "../services/AssignmentService";
export default {
    name: 'user-assignments',
    methods: {
        dayNameAndTime(date) {
          const getFullName = moment(date).format('dddd, h:mm a');
          return getFullName;
        }
    },    
    data() {
        return {
           
            userAssignments:  [],
            currentUserId: this.$store.state.user.id,
            
    };
    },
    created() {
        
        assignmentService.getAssignmentsByUser(this.currentUserId)
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
  border: 5px double rgb(251, 172, 14);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  display: inline-flexbox;
  flex-wrap: wrap;
  flex-direction: row;
  width: 100vh;
}


</style>