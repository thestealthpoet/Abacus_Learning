<template>
  <form v-on:submit.prevent="saveTopic" class="topic-creation-form">
    
    <div>
            <h4> {{selectedCourse.courseName}} </h4>
             
    </div>
    <div class="field">
      <label for="topic-name">Topic Title</label>
      <input type="text"
      v-bind:class="{'needs-content': topicName==='' }"
      required
      v-model.trim="topic.topicName"/>
    </div>
    <div class="field">
        <label for="description">Topic Description</label>
        <textarea id="description"
        v-model="topic.description" />
    </div>
    <div class="field">
      <label for="datetime-due">Due Date for Exercise</label>
      <input type="datetime-local"
      v-bind:class="{'needs-content': topicDueDate==='' }"
      required
      v-model="topic.topicDueDate"/> 
    </div>
    <div class="field">
      <label for="teach-date">Optional Topic Teach Date</label>
      <input type="datetime-local"
      v-model="topic.teachDate"/>
    </div> 
    <button id="btn" class="btn btn-submit">Create Topic</button>
    <div class="add-assignments">
                    <button id="btn" @click="$router.push({name: 'create-assignment'}); setSelectedCourseId(course.courseId)">Add an assignment</button>
           </div>
    </form>


</template>

<script>
import topicService from "../services/TopicService";
import courseService from "../services/CourseService";

export default {
    name: "create-topic",
    props: [
        'selectedCourseId'
    ],
    data() {
        return {
            topic: {
                courseId: this.selectedCourseId,
                topicName: '',
                description: '',
                topicDueDate: '',
                teachDate: ''
            },
            
            courses: [],

            selectedCourse: {
                courseId: 0,
                courseName: '',

            }
        
        };
    },
    methods: {
        saveTopic() {
            topicService.createTopic(this.topic)
            .then(response => {
                if (response.status === 201) {
                    topicService.listTopics().then(response => {
                        this.$store.commit("", response.data);
                    });
                    this.topic = {
                        courseId: '',
                        name: '',
                        description: '',
                        dueDate: '',
                        teachDate: ''
                    }
                    this.$router.push({name: 'myDashboard'});
                }
            }).catch(error => {
                this.errorMsg = error.response.statusText;
            });
        },
    },
    created() {
        courseService.listCourses()
        .then((courseData) => {
            this.courses = courseData.data;
            for (let course of this.courses) {
                if (course.courseId === this.selectedCourseId) {
                    this.selectedCourse = course;
                }
            }
        })
        .catch(error =>{
            console.error(error + 'data could not be loaded')
        });
    }

}
</script>

<style>

.topic-creation-form{
    display: inline-grid;
    height: 45vh;
    width: 35vw;
    border: 3px solid #219EBC;
    border-radius: 3px;
    padding: 40px;
    margin: 80px;
}
.field{
    display: flex;
    flex-direction: column;
    justify-self: stretch;
}

/* .needs-content {
    background-color: #FBAC0E;
} */
</style>