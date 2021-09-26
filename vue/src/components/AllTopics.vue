<template>
    <div class="main">
        <div class="topics" v-for="topic in topics" :key="topic.id">

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
        topicService.listTopics
    }
    
}
</script>