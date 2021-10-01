<template>
    <div class="main">
        
        <div class="view-assignments" v-for="assignment in assignments" :key="assignment.id">
            <div><h3> {{assignment.assignmentName}}</h3></div>

            <div><h4>{{assignment.assignmentType}}</h4></div>
            <div> {{dayNameAndTime(assignment.dueDate)}}</div>
        </div>
    </div>
</template>
<script>
import moment from 'moment';
import assignmentService from "../services/AssignmentService";
export default {
    name: 'view-assignments',
    methods: {
        dayNameAndTime(date) {
          const getFullName = moment(date).format('dddd, h:mm a');
          return getFullName;
        }
    },

    data() {
        return {
            assignments: [],
        }
    },
    created() {
        assignmentService.listAssignments()
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
.main {
    
   display: flex;
   flex-direction: column;
   flex-wrap: wrap;
   justify-content: space-around;
   padding-top: 40px;
}
.view-assignments{
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 5px;
  width: 25rem;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}


</style>