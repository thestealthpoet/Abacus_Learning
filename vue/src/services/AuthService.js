import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {

  login(user) {
    return http.post('/login', user)
  },

  register(user) {
    return http.post('/register', user)
  }

}
