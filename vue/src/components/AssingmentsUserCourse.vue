<template>
  <div class="main">
      <div class="assignments-user-course">
          <div class="courses" v-for="course in userCourses" :key="course.id" >
            <div class="course-name">
                Course Name: {{course.courseName}}
            </div>
            <div class="course-description">
                Course Description: {{course.courseDescription}}
            </div>
            <div class="class-time">
                Course Time: {{course.classTime}}
            </div>
            <div class="show-teacher" v-if="course.courseTeacher === currentUserId">
                You are the teacher of this course.
            </div>
          </div>
      </div>
  </div>
</template>

<script>
import courseService from "../services/CourseService";
export default {
    name: 'view-user-courses',
    data() {
        return {
            userCourses:  [],
            currentUserId: this.$store.state.user.id,
            isTeacher: false,
    };
    },
    created() {
        courseService.listCoursesByCurrentUserId(this.currentUserId)
        .then( (userCoursesData) => {
            this.userCourses = userCoursesData.data;
        })
        .catch( (error) => {
            console.error(error + "user courses not loaded");
        });

        
        
    },

}
</script>

<style>

</style>