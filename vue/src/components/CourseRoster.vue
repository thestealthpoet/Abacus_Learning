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
            images: [
                '../assets/legohead1.jpg',
                '../assets/legohead2.jpg',
                '../assets/legohead3.jpg',
                '../assets/legohead4.jpg',
                '../assets/legohead5.jpg',
                '../assets/legohead6.jpg',
                '../assets/legohead7.jpg',
                '../assets/legohead8.jpg',
                '../assets/legohead9.jpg'
            ]
        }
    },

    methods: {
        randomImage() {
            return this.images[Math.floor(Math.random()*this.images.length)];
        }

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