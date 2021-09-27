<template>
    <div class="main">
        <div class="view-topics" v-for="topic in topics" :key="topic.id">
        <div> Topic Name: {{topic.topicName}}</div>
        <div> Topic Due Date: {{topic.topicDueDate}}</div> }
        </div>
    </div>
</template>
<script>
import topicService from "../services/TopicService";
export default {
    name: 'view-topics',
    data() {
        return {
            topics: [],
        };
    },
    created() {
        topicService.listTopics()
        .then((topicsData) => {
            this.topics = topicsData.data;
        
        })
        .catch((error) => {
            console.error(error + " all topics not able to be loaded");
        });
    }
    
}
</script>