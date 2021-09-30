import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
//Login & Registration stuff
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'



//Course related components
import CreateCourse from '../views/CreateCourse.vue'
import CreateCurricula from '../views/CreateCurricula.vue'
import CourseProgress from '../views/CourseProgress.vue'
//View courses
//import ViewCurricula from '../views/ViewCurricula.vue'
import UserCourses from '../views/UserCourses.vue'
import CourseList from '../views/CourseList.vue'

//User lists
import UserList from '../views/UserList.vue'
import Roster from '../views/Roster.vue'

//404!
import Missing from '../views/Missing.vue'
//Course content creation
import CreateTopic from '../views/CreateTopic.vue'
import AllTopics from '../views/AllTopics.vue'
import AllAssignments from '../views/AllAssignments.vue'
import CreateAssignment from '../views/CreateAssignment.vue'
import AssignmentsUser from '../views/AssignmentsUser.vue'
//import TopicsByCourseUser from '../views/TopicsByCourseUser.vue'
import TopicsUser from '../views/TopicsUser.vue'
/////Footer Imports/////
//General Info about App
import About from '../views/About.vue'
//Terms of Service
import Terms from '../views/Terms.vue'
//Privacy Policy for Abacus app
import PrivacyPolicy from '../views/PrivacyPolicy.vue'
import TopicsByCourse from '../views/TopicsByCourse.vue'

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
      path: '/myDashboard/:username',
      name: 'myDashboard',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
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
      path: "/curricula",
      name: "view-curricula",
      component: Register,
      meta: {
        requiresAuth: true
      }
    },
    {  
      path: "/myCourses",
      name: "my-courses",
      component: UserCourses,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/courseProgress",
      name: "course-progress",
      component: CourseProgress,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/course-list",
      name: "course-list",
      component: CourseList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/userlist",
      name: "user-list",
      component: UserList,
      meta: {
        requiresAuth: true
      }

    },
    {
      path: '*',
      component: Missing
    },
    {
      path: "/topics",
      name: "create-topic",
      component: CreateTopic,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/topics/all",
      name: "all-topics",
      component: AllTopics,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/assignments/all",
      name: "all-assignments",
      component: AllAssignments,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/assignments",
      name: "create-assignment",
      component: CreateAssignment,
      meta: {
        requiresAuth: false
      }
    },
    
    {
      path: '/myAssignments',
      name: 'assignments-user',
      component: AssignmentsUser,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/about",
      name: "about",
      component: About,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/terms',
      name: 'terms',
      component: Terms,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/privacy-policy',
      name: 'privacy-policy',
      component: PrivacyPolicy,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/courses/:courseName/roster',
      name: 'roster',
      component: Roster,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/myTopics',
      name: 'topics-user',
      component: TopicsUser,
      meta: {
        requiresAuth: false
      }
    },
    {
      path:'/topics/:courseId',
      name: 'course-topics',
      component: TopicsByCourse,
      meta: {
        requiresAuth: false
      }

    }

  ]
});

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
