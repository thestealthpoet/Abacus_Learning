<template>
  <form v-on:submit.prevent class="course-creation-form">
     <div class="field">
      <label for="course-title">Course Title</label>
      <input type="text"
      v-model="course.name" />
    </div>
    <div class="field">
        <label for="description">Course Description</label>
        <input type="text"
        v-model="course.description" />
    </div>
    <div class="field">
        <label for="difficulty-level">Difficulty Level</label>
        <select id="difficulty-level-options"
        v-model="course.difficultyLevel">
        <option disabled value="">Please select one</option>
        <option>Novice</option>
        <option>Moderate</option>
        <option>Experienced</option>
        </select>
    </div>
    <div class="field">
        <label for="datetime-class">Select weekly class day and time</label>
        <input type="datetime-local"
            v-model="course.classTime" />
    </div>
    </form>


</template>

<script>
export default {
    name: "create-course",
    data() {
        return {
            course: {
                name: '',
                description: '',
                difficultyLevel: '',
                classTime: ''
            },
        };
    },

}
</script>

<style>

</style>