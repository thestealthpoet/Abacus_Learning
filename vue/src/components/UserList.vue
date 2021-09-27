<template>
<div class="main">
  <form v-on:submit.prevent="addStudentsToRoster" class="roster-creation-form">
  <div class="user-list">
      <div class="users" v-for="user in userList" :key="user.id">
        <div class="name">
          {{user.name}}
        </div>
        <div class="username">
          {{user.username}}
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
        <button id="btn" class="btn btn-submit">Add Selected User to Course</button>
      </div>
    </form>

</div>
  
</template>

<script>
import userService from '../services/UserService';
import rosterService from '../services/RosterService'
export default {
name: 'user-list',


data() {
  return {
    userList: [],
    selectedUsers: [],

  };
},

methods: {
  selecteStudentId() {
    
     this.selectedUsers.selectedUserId = this.userList.user.id; 
  },

  addStudentsToRoster() {
    rosterService.addStudentsToCourseRoster(this.selectedUsers, this.$store.state.selectedCourseId);
  }
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
.users {
  display: flex;
  align-content: space-between;
  flex-direction: column;
  flex-wrap: wrap;

}

</style>