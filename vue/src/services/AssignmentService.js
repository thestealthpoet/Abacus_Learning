import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {

//will return a list of assignments for course
getCourseAssignments(courseId, assignmentId) {
    return http.get(`/course/${courseId}/assignment/${assignmentId}/all`)
},
//will return all assignments
listAssignments() {
  return http.get('/assignments/all');
},

//will create an assignment (post)
createAssignment(assignment) {
  return http.post('/assignments', assignment);
},

//will get assignments by user
getAssignmentsByUser(userId) {
  return http.get(`/assignments/user/${userId}`);
},

//will get assignments by topic
getAssignmentsByTopic(topicId) {
  return http.get(`/assignments/${topicId}`);
}
}