<template>
  <div class="main">
    <div class="course-list">
        <div class="courses" v-for="course in courseList" :key="course.id" >
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
              <div id="role-label">You are the teacher of this course.</div>
              <button id="btn" class="add-student-btn">Add students to this course</button>
          </div>
          <!-- <div id="role-label" class="else" v-else>
              You are not the teacher of this course.
          </div> -->
        </div>
    </div>      
  </div>
</template>

<script>
import courseService from "../services/CourseService";
export default {
  name: 'course-list',
  data() {
    return {
      courseList: [],
      currentUserId: this.$store.state.user.id,

    };
  },

  created() {
    courseService.listCourses()
    .then( (coursesData)  => {
      this.courseList = coursesData.data;
    })
    .catch( (error) => {
      console.error(error + " all courses not able to be loaded");
    }) 

    
  },


}
</script>

<style>
.courses {
  border: 5px double rgb(9, 115, 148);
  margin: 10px;
  padding: 16px;
  border-radius: 10px;
  display: inline-flexbox;
  flex-wrap: wrap;
  flex-direction: row;
}

.show-teacher {
  display: flex;
  justify-content: space-between;
}

#role-label {
  text-decoration: overline;
  padding: 20px 0px 0px 20px;
}
</style>