import axios from 'axios';

const http = axios.create( {
  baseURL: process.env.VUE_APP_REMOTE_API //remember this is http://localhost:8080 from env
});

export default {

    //will return a list of all courses
    listCourses() {
        return http.get('/course/all');
    },

    //will retrieve a specific course
    getCourse(courseId) {
        return http.get(`/course/${courseId}`);
    },

    //will create a course (post)
    createCourse(course) {
        return http.post('/course', course);
    },

    //will update a course (put)
    updateCourse(courseId, course) {
        return http.put(`/course/${courseId}`, course);
    },

    //will delete course (!!)
    deleteCourse(courseId) {
        return http.delete(`/course/${courseId}`);
    },

    //will return the specific teacher(s) associated the course 
    listCourseTeacher(courseId) {
        return http.get(`/course/${courseId}/teachers`);
    },

    //will return a list of students in the course
    listCourseStudents(courseId) {
        return http.get(`/course/${courseId}/students`);
    },

    //will fetch specific student from the course
    getCourseStudent(courseId, userId) {
        return http.get(`/course/${courseId}/students/${userId}`);
    },

    //will add content to course
    addCourseContent(courseId, content) {
        return http.post(`/course/${courseId}/content`, content);
        
    }












}