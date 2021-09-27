import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {

    //Will fetch a list of all users

    getUsersList() {
        return http.get('/users/all');
    }

}