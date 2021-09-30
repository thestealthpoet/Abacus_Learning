<template>
    <div class="main">
        <div class="view-topics" v-for="topic in topics" :key="topic.id">
        <div> <h3> {{topic.topicName}} </h3></div>
        <div> Due: {{dayNameAndTime(topic.topicDueDate)}}</div> 
        </div>
    </div>
</template>
<script>
import moment from 'moment';
import topicService from "../services/TopicService";
export default {
    name: 'view-topics',
    methods: {
        dayNameAndTime(date) {
          const getFullName = moment(date).format('dddd, h:mm a');
          return getFullName;
        }
    },
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

<style>
.main {
   column-count: 2;
    
   display: flex;
   flex-direction: column;
   flex-wrap: wrap;
   justify-content: space-around;
    
}
.view-topics{
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 5px;
  width: 25rem;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

</style>