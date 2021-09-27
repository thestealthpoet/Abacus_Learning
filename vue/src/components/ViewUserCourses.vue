<template>
  <div class="main">
      <div class="course-list">
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
                <button @click="$router.push( {name: 'user-list'})">Add students to this course</button>
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
            //value of userCourses
            //key values are column name
            //modeling java
            //course.courseName equates to course.getName()
            userCourses:  [],
            currentUserId: this.$store.state.user.id,
            isTeacher: false,
    };
    },
    created() {
                                               //logged in store
        courseService.listCoursesByCurrentUserId(this.currentUserId)
        //when you receive the data back as a list of course Object data
        //userCoursesData is a var
        //loaded into an array
        //values from db
        //don't have to define already defined columns
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