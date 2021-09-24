import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {
//will bring up topics by course number
getTopicsByCourse(courseId) {
    return http.get(`/courses/${courseId}/topics`)
},

}