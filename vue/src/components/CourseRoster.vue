<template>
  <div class="main">
      <div class="roster" v-for="member in roster" :key=member.id>
          <div class="member-name">
              Student name: {{member.name}}
          </div>
          <div class="member-email">
              Student Email: {{member.emailAddress}}
          </div>
        
      </div>
  </div>
</template>

<script>
import rosterService from '../services/RosterService';
export default {
    name: 'course-roster',

    data() {
        return {
            roster: [],
            selectedCourseId: this.$store.state.selectedCourseId,
        }
    },

    methods: {

    },

    created() {
        rosterService.getRosterByCourseId(this.selectedCourseId)
        .then( (rosterData) => {
            this.roster = rosterData.data;
        })
        .catch( (error) => {
            console.error(error + " roster was not able to be loaded.");
        })

    }


}
</script>

<style>

</style>