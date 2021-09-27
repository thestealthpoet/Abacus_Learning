<template>
    <div class="view-curricula">
        <all-assignments/>
        <all-topics/>
    </div>
</template>

<script>
import AllAssignments from '@/components/AllAssignments';
import AllTopics from '@/components/AllTopics';
export default {
    
    components: 
    {AllAssignments, 
    AllTopics}
    
};

</script>

<style>

</style>