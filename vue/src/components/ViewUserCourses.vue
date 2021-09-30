<template>
  <div class="main">
      <div class="course-list">
          <div class="no-courses" v-if="userCourses.length == 0">
              <button id="btn" class="create-course-btn" @click="$router.push({ name: 'course-creation' })">Create your first course!</button>
          </div>
          <div v-else class="courses" v-for="course in userCourses" :key="course.id" >
            <div class="course-name">
                <h3> {{course.courseName}} </h3>
            </div>
            <div class="course-description">
                <em> {{course.courseDescription}} </em>
            </div>
            <br>
            <div class="class-time">
                - {{dayNameAndTime(course.classTime)}}
            </div>
            <div class="show-teacher" v-if="course.courseTeacher === currentUserId">
                <div id="role-label">You are the teacher of this course.</div>
                <button id="btn" @click="$router.push( {name: 'user-list', params: {courseName: course.courseName}}); setSelectedCourseId(course.courseId)">Add students to this course</button>
            
            <div class="show-topics">
                    <button id="btn" @click="$router.push({name: 'curricula-creation'}); setSelectedCourseId(course.courseId)">Add content to this course</button>
           </div>
           <div class="show-roster">
               <button id="btn" @click="$router.push( {name: 'roster', params: {courseName: course.courseName}}); setSelectedCourseId(course.courseId)">View Course Roster</button>
           </div>
           </div>     
          </div>
      </div>
  </div>
</template>

<script>
import moment from 'moment';
import courseService from "../services/CourseService";
export default {
    name: 'view-user-courses',
    methods: {
        setSelectedCourseId(courseId) {
            this.$store.commit("SET_SELECTED_COURSE", courseId);
        },
        dayNameAndTime(date) {
          const getFullName = moment(date).format('dddd, h:mm a');
          return getFullName;
        }
    },
    data() {
        return {
            
            userCourses:  [],
            currentUserId: this.$store.state.user.id,
           
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
  color: red;
}
</style>