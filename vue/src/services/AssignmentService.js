import axios from 'axios';

const http = axios.create( {
  baseURL: "VUE_APP_REMOTE_API" //remember this is http://localhost:8080 from env
});

export default {

//will return a list of assignments for course
getCourseAssignments(courseId) {
    return http.get(`/course/${courseId}/assignment/all`)
}







    
}