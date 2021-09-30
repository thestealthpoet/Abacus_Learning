<template>
  <div class="main">
      <div class="topics-list">
          <div class="course-topics" v-for="topic in courseTopics" :key="topic.id" >
            <div class="topic-name">
                <h3> {{topic.topicName}} </h3>
            </div>
            <div class="topic.topic-description">
                 <h4>{{topic.topicDescription}}</h4>
            </div>
            <div class="class-time">
                Due Date: {{new Date(topic.topicDueDate).toLocaleString()}}
            </div>
            </div>
      </div>
  </div>
</template>

<script>
import topicService from "../services/TopicService";
export default {
    name: 'course-topics',
  
    data() {
        return {
            courseTopics:  [],
            selectedCourseId: this.$store.selectedCourseId,
        };
    },
    created() {
                                               //logged in store
        topicService.getTopicsByCourse(this.currentCourseId)
        //when you receive the data back as a list of course Object data
        //userCoursesData is a var
        //loaded into an array
        //values from db
        //don't have to define already defined columns
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
.assignments {
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  display: inline-flexbox;
  flex-wrap: wrap;
  flex-direction: row;
}


</style>