<template>
    <div class="main">
        <div class="assignments" v-for="assignment in assignments" :key="assignment.id">

        </div>
    </div>
</template>
<script>
import assignmentService from "@/services/AssignmentService";
export default {
    name: 'view-assignments',
    data() {
        return {
            assignments: [],
        };
    },
    created() {
        assignmentService
        .list()
    },
    
};
</script>


<style>

</style>