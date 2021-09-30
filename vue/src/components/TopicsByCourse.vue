<template>
  <div class="main"> 
      <div class="topics-list">
          <div class="course-topics" v-for="topic in courseTopics" :key="topic.id" >
            <div class="topic-name">
                <h3> {{topic.topicName}} there</h3>
            </div>
            <div class="topic.description">
                 <h4>{{topic.topicDescription}}</h4>
            </div>
            <div class="class-time">
                Due Date: {{dayNameAndTime(topic.topicDueDate)}}
            </div>
            </div>
      </div>
  </div>
</template>

<script>
import topicService from '../services/TopicService';
import moment from 'moment';
export default {
    name: 'topics-by-course',
    methods: {
        dayNameAndTime(date) {
          const getFullName = moment(date).format('MMMM Do YYYY, h:mm:ss a');
          return getFullName;
        },
    },
  
    data() {
        return {
            courseTopics:  [],
            selectedCourseId: this.$store.state.selectedCourseId,
        };
    },
    created() {
                                               
        topicService.getTopicsByCourse(this.selectedCourseId)
        
        .then( (courseTopicData) => {
            this.courseTopics = courseTopicData.data;
        })
        .catch( (error) => {
            console.error(error + "course topics not loaded");
        });
        
    },

}
</script>

<style>
.course-topics {
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  display: inline-flexbox;
  flex-wrap: wrap;
  flex-direction: row;
}


</style>