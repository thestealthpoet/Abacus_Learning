<template>
  <form v-on:submit.prevent="saveCourse" class="course-creation-form">
     <div class="field">
      <label for="course-title">Course Title</label>
      <input type="text"
      v-model="course.courseName" />
    </div>
    <div class="field">
        <label for="description">Course Description</label>
        <textarea id="description"
        v-model="course.courseDescription" />
    </div>
    <div class="field">
        <label for="difficulty-level">Difficulty Level</label>
        <select id="difficulty-level-options"
        v-model="course.difficultyLevel">
        <option disabled value="">Please select one</option>
        <option>Novice</option>
        <option>Moderate</option>
        <option>Experienced</option>
        </select>
    </div>
    <div class="field">
        <label for="datetime-class">Select weekly class day and time</label>
        <input type="datetime-local"
            v-model="course.classTime" />
    </div>
    <button class="btn btn-submit">Submit</button>
    </form>


</template>

<script>
import courseService from "../services/CourseService";

export default {
    name: "create-course",
    data() {
        return {
            course: {
                courseName: '',
                courseDescription: '',
                difficultyLevel: '',
                classTime: '',
                courseTeacher: this.$store.state.user.id,
            },
            errorMsg: ''
        };
    },
    methods: {
        saveCourse() {
            courseService.createCourse(this.course)
            .then(response => {
                if (response.status === 201) {
                    courseService.listCourses().then(response => {
                        this.$store.commit("", response.data);
                    });
                    this.course = {
                        name: '',
                        description: '',
                        difficultyLevel: '',
                        classTime: ''
                    }
                    this.$router.push('/courses');
                }
            }).catch(error => {
                this.errorMsg = error.response.statusText;
            });
        },
    },
}
</script>

<style>

</style>