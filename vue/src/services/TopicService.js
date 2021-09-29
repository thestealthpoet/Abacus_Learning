import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {
//will bring up topics by course number
getTopicsByCourse(courseId) {
    return http.get(`/courses/topics/${courseId}`)
},
//will create topic
createTopic(topic) {
  return http.post(`/topics`, topic);

},
//will list all topics
listTopics() {
  return http.get('/topics/all');
},
getTopicsByCourseAndUser(courseId, userId){
  return http.get(`/topics/${courseId}/${userId}`)
},
getTopicsByUser(userId) {
  return http.get(`topics/${userId}`)
},
}