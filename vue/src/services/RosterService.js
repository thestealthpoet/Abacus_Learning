import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {
    addStudentsToCourseRoster(rosterEntryList, courseId) {   
        return http.post(`/courses/roster/${courseId}`, rosterEntryList);
    },

    getRosterByCourseId(courseId) {
      return http.get(`/courses/${courseId}/roster`);
    },

    

}