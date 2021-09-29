<template>
  <div class="main">
      <div class="topics-list">
          <div class="topics" v-for="topic in userTopics" :key="topic.id" >
            <div class="topic-name">
                 {{topic.topicName}}
            </div>
            <div class="topic-description">
                Course Description: {{topic.topicDescription}}
            </div>
            <div class="topic-due-date">
                Due Date: {{topic.topicDueDate}}
            </div>
                
          </div>
      </div>
  </div>
</template>

<script>
import topicService from "../services/TopicService";
export default {
    name: 'topics-by-course-user',
    methods: {
        setSelectedCourseId(courseId) {
            this.$store.commit("SET_SELECTED_COURSE", courseId);
        }
    },
    data() {
        return {
            
            userTopics:  [],
            currentUserId: this.$store.state.user.id,
    };
    },
    created() {
                                        
        topicService.getTopicsByCourseUser(this.currentUserId, this.courseId)
    
        .then( (userTopicsData) => {
            this.userTopics = userTopicsData.data;
        })
        .catch( (error) => {
            console.error(error + "user courses not loaded");
        });

        
        
    },

}
</script>

<style>
.topics-list {
    font-family: 'Roboto', sans-serif;
}
</style>