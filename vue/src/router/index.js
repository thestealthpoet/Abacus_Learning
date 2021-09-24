import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import About from '../views/About.vue'
import CreateCourse from '../views/CreateCourse.vue'
import CreateCurricula from '../views/CreateCurricula.vue'
<<<<<<< HEAD
// eslint-disable-next-line no-unused-vars
import ViewCurricula from '../views/ViewCurricula.vue'
=======
import UserCourses from '../views/UserCourses.vue'
>>>>>>> 76627cfb4dc39107a7981da4fe2770a7dc2a561d

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/about",
      name: "About",
      component: About,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/course-creation",
      name: "course-creation",
      component: CreateCourse,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/curricula-creation",
      name: "curricula-creation",
      component: CreateCurricula,
      meta: {
        requiresAuth: true
      }
    },
    {
<<<<<<< HEAD
      path: "/curricula",
      name: "view-curricula",
      component: Register,
      meta: {
        requiresAuth: false
=======
      path: "/myCourses",
      name: "my-courses",
      component: UserCourses,
      meta: {
        requiresAuth: true
>>>>>>> 76627cfb4dc39107a7981da4fe2770a7dc2a561d
      }
    },

  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
