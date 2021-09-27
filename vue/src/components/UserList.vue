<template>
<div class="main">
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

      </div>
    </div>

</div>
  
</template>

<script>
import userService from '../services/UserService';
export default {
name: 'user-list',
data() {
  return {
    userList: [],
    selectedUsers: {
      selectedUserId: '',
      selectedCourseId: this.$store.state.selectedCourseId
    },

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
.users {
  display: flex;
  align-content: space-between;
  
  flex-wrap: wrap;

}

</style>