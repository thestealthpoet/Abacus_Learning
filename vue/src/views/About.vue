<template>
  <div class="about">
      <h1>Abacus</h1>
      <h2>eLearning made easy.</h2>
      <h3>Abacus is an eLearning portal designed by a group of Tech Elevator students from the NLR(3) cohort. 
        Simililiar to that of the ancient mathematical tool, Abacus keeps track of course progression for teachers and students.
        Just like sliding beads across a wire frame, students see in real time when assignments are completed. 
        At Abacus anyone can create a course to teach or jump in learning a new skill. Sign-up for an account and start gaining knowledge today!
      </h3>
      <img class="ancient-abacus" src="@/assets/Abacus.jpg" alt="An ancient Abacus counting tool">
    </div>
</template>

<script>
export default {
  name: "About"
};
</script>

<style>
.about {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: 
  "title img img"
  "slogan img img"
  "body body body"
  "body body body";
  padding: 80px 200px 40px 200px;
  justify-items: center;
}

.ancient-abacus {
  width: 280px;
  height: 140px;
  border: 4px solid rgb(0, 48, 73);
  grid-area: img;
  border-radius: 25px;
}

h1 {
  grid-area: title;
}

h2 {
  grid-area: slogan;
  text-decoration-line: underline;
}

h3 {
  grid-area: body;
}
</style>