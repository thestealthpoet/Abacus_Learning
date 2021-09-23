import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
<<<<<<< HEAD
// // import { Datetime } from 'vue-datetime';
 
// Vue.component('datetime', Datetime);
=======

 

>>>>>>> 06f54c367b7936c328ee9f2fa610ad21ec70df17

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
