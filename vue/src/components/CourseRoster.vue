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
    name: 'course-roster',

    data() {
        return {
            roster: [],
            selectedCourseId: this.$store.state.selectedCourseId,
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
        }
    },

    methods: {
        selectRandomImage() {
    return this.images[Math.floor(Math.random()*this.images.length)]; 

        },

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

.roster {
    display: flex;
    flex-direction: column;
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 5px;
  border-radius: 10px;
}

.main scoped{
    display: grid;
  grid-template-columns: 250px 250px 250px;
}

</style>