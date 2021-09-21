import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {

//will return all grades for an assignment
listCourseAssignments(courseId, assignmentId) {
    http.get(`/course/${courseId}/assignment/${assignmentId}/grade/all`);
},









    
}