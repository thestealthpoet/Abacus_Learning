<template>
  <div class="main">
    <div class="course-list">
        <div class="courses" v-for="course in courseList" :key="course.id" >
          <div class="course-name">
              <h4> {{course.courseName}} </h4>
          </div>
          <div class="course-description">
              <em> {{course.courseDescription}} </em>
          </div>
          <br>
          <div class="class-time">
                - {{dayNameAndTime(course.classTime)}}
            </div>
            <div class="show-topics">
              <button id="btn"  @click="$router.push({name: 'course-topics',  params: {courseId: course.courseId}}); setSelectedCourseId(course.courseId)"> view topics</button>
            </div>

            <div class="show-teacher" v-if="course.courseTeacher === currentUserId">
                <div id="role-label">You are the teacher of this course.</div>
                <button id="btn" @click="$router.push( {name: 'user-list'}); setSelectedCourseId(course.courseId)">Add students to this course</button>
            
            <div class="show-topics">
                    <button id="btn" @click="$router.push({name: 'curricula-creation'}); setSelectedCourseId(course.courseId)">Add content to this course</button>
           </div>
           
           </div>
           <div class="show-join" v-else>
             <button>Join Class</button>
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
import rosterService from '../services/RosterService';
import moment from 'moment';
export default {
  name: 'course-list',
  methods: {
        setSelectedCourseId(courseId) {
            this.$store.commit("SET_SELECTED_COURSE", courseId);
        },
        dayNameAndTime(date) {
          const getFullName = moment(date).format('dddd, h:mm a');
          return getFullName;
        },
        joinCourse() {
          if(confirm("Are you sure want to join this course?")) {
          rosterService.addStudentsToCourseRoster(this.student, this.$store.state.selectedCourseId);
          }
        },
        setStudentCourseChoiceId(courseId) {
          this.student.selectedCourseId = courseId;
        }

  
    },
  data() {
    return {
      courseList: [],
      currentUserId: this.$store.state.user.id,
      student: [],


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