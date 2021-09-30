<template>
<div class="main">
  
   <form v-on:submit.prevent="addStudentsToRoster" class="roster-creation-form">
    <div class="user-list">      
      <div class="users" v-for=" user in userList" :key="user.id">
        <img id="profile-pic" :src="selectRandomImage()">
        
        <div class="name">
          {{user.name}}
        </div>
        <div class="username">
          @{{user.username}} 
        </div>
        <div class="email-address">
          {{user.emailAddress}}  
        </div>
        <div class="checkbox">
        <input type="checkbox" id="user-select-checkbox" v-bind:value="{
        selectedUserId: user.id,
        selectedCourseId: $store.state.selectedCourseId}" v-model="selectedUsers">
        <label for=user-select-checkbox>Add student to roster</label>
        </div>
      </div>
        
    </div>
    <center><button id="btn" class="btn-submit">Add Selected User to Course</button></center>
  </form>

</div>
  
</template>

<script>
import userService from '../services/UserService';
import rosterService from '../services/RosterService';
import legohead1 from '../assets/legohead1.jpg';
import legohead2 from '../assets/legohead2.jpg';
import legohead3 from '../assets/legohead3.jpg';
import legohead4 from '../assets/legohead4.jpg';
import legohead5 from '../assets/legohead5.jpg';
import legohead6 from '../assets/legohead6.jpg';
import legohead7 from '../assets/legohead7.jpg';
import legohead8 from '../assets/legohead8.jpg';
import legohead9 from '../assets/legohead9.jpg';
export default {
name: 'user-list',


data() {
  return {
    userList: [],
    selectedUsers: [],
    images: [
                legohead1,
                legohead2,
                legohead3,
                legohead4,
                legohead5,
                legohead6,
                legohead7,
                legohead8,
                legohead9
            ],
      selectedImage: null,

  };
},

methods: {
  selecteStudentId() {
    
     this.selectedUsers.selectedUserId = this.userList.user.id; 
  },

  selectRandomImage() {
    return this.images[Math.floor(Math.random()*this.images.length)];
     
    
  },

  addStudentsToRoster() {
    rosterService.addStudentsToCourseRoster(this.selectedUsers, this.$store.state.selectedCourseId);
  }
},

created() {

//this.selectedImage = this.selectRandomImage(this.images);

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
.user-list {
  display: grid;
  grid-template-columns: 250px 250px 250px;
  
  
}

.users {
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  
}

.name {
  font-size: 22px;
  font-weight: bold;
  color: rgb(9, 115, 148);
}

#btn {
  margin: 10px;
}

.check-box {
  /* padding: 0px 0px 0px 20px; */
}

#profile-pic {
  display: flex;
  height: 8rem;
  width: auto;
  margin: 5px;
  border: 3px solid;
  border-radius: 8px;
  
}

</style>