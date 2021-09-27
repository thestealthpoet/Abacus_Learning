<template>
<div class="main">
  <form v-on:submit.prevent="addStudentsToRoster" class="roster-creation-form">
    <div class="user-list">
      <div class="users" v-for="user in userList" :key="user.id">
        <div class="name">
          {{user.name}} &#124;
        </div>
        <div class="username">
          {{user.username}} &#124;
        </div>
        <div class="email-address">
          {{user.emailAddress}}  
        </div>
        <div class="checkbox">
        <input type="checkbox" id="user-select-checkbox" v-bind:value="{
        selectedUserId: user.id,
        selectedCourseId: $store.state.selectedCourseId}" v-model="selectedUsers">
        </div>
      </div>
        <button id="btn" class="btn-submit">Add Selected User to Course</button>
    </div>
  </form>

</div>
  
</template>

<script>
import userService from '../services/UserService';
import rosterService from '../services/RosterService'
export default {
name: 'user-list',
methods: {
  selecteStudentId() {
    
     this.selectedUsers.selectedUserId = this.userList.user.id; 
  },

  addStudentsToRoster() {
    rosterService.addStudentsToCourseRoster(this.selectedUsers, this.$store.state.selectedCourseId);
  }
},

data() {
  return {
    userList: [],
    selectedUsers: [],

  };
},

created() {
  userService.getUsersList()
  .then( (userData) => {
    this.userList = userData.data;
  })
  .catch( (error) => {
    console.error(error + " user list not able to be loaded.");
  })
}
}
</script>

<style>
.roster-users-list {
  /* display: flex;
  align-content: space-between;
  flex-direction: column;
  flex-wrap: wrap; */
  display: flex;
  flex-direction: column;
}

.users {
  display: flex;
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
}

#btn {
  margin: 10px;
}

.check-box {
  /* padding: 0px 0px 0px 20px; */
}

</style>