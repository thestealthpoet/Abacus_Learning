<template>
  <div class="main">
      <div class="topics-list">
          <div class="assignments" v-for="topic in userTopics" :key="topic.id" >
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
    name: 'user-topics',
    data() {
        return {
            //value of userCourses
            //key values are column name
            //modeling java
            //course.courseName equates to course.getName()
            userTopics:  [],
            currentUserId: this.$store.state.user.id,
            //isTeacher: false,
        };
    },
    created() {
                                               //logged in store
        topicService.getTopicsByUser(this.currentUserId)
        //when you receive the data back as a list of course Object data
        //userCoursesData is a var
        //loaded into an array
        //values from db
        //don't have to define already defined columns
        .then( (userTopicData) => {
            this.userTopics = userTopicData.data;
        })
        .catch( (error) => {
            console.error(error + "user assignments not loaded");
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