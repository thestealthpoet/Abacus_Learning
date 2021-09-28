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
                Course Time: {{new Date(course.classTime).toLocaleString()}}
            </div>
            <div class="show-teacher" v-if="course.courseTeacher === currentUserId">
                <div id="role-label">You are the teacher of this course.</div>
                <button id="btn" @click="$router.push( {name: 'user-list'}); setSelectedCourseId(course.courseId)">Add students to this course</button>
            </div>
            <div class="show-topics">
                    <button @click="$router.push({name: 'curricula-creation'}); setSelectedCourseId(course.courseId)">Test</button>
           </div>     
          </div>
      </div>
  </div>
</template>

<script>
import courseService from "../services/CourseService";
export default {
    name: 'view-user-courses',
    methods: {
        setSelectedCourseId(courseId) {
            this.$store.commit("SET_SELECTED_COURSE", courseId);
        }
    },
    data() {
        return {
            //value of userCourses
            //key values are column name
            //modeling java
            //course.courseName equates to course.getName()
            userCourses:  [],
            currentUserId: this.$store.state.user.id,
            //isTeacher: false,
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