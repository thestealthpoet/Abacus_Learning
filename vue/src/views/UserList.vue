<template>
  <div class="main">
    <user-list />
      
  </div>
</template>

<script>

import UserList from '../components/UserList.vue'
export default {
  components: {
    UserList,
  },


}
</script>

<style>
.user-list {
  display: flex;
  flex-direction: row;
  justify-content: space-around;

}

</style>