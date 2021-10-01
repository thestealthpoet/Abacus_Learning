<template>
    <div class="Pokemon101">
        <div class="c-container">
            <p class="cN">Pokemon 101</p>
            <img class="pB" src="@/assets/progress20.png" alt="Wire Frame 20%">
            <p class="lG">Grade: <strong>D</strong></p>
        </div>
        <div class="cU-container">
            <p class="cU">Curriculum</p>
                <p class="dD">Due Date</p>
                <p class="aG">Points</p>
            <!-- <p class="t1">Pokemon Types</p> -->
                <center><p class="a1A">Pokemon Type Chart</p></center>
                <p class="dD1">09/17/21</p>
                <p class="a1G">10/10</p>
            <!-- <p class="t2">Pokemon Abilities</p> -->
                <p class="a2A">Abilities Flash Cards</p>
                <p class="dD2">09/24/21</p>
                <p class="a2G">9/10</p>
            <!-- <p class="t3">Catching Pokemon</p> -->
                <p class="a3A">Pokeball catch rates</p>
                <p class="dD3">10/01/21</p>
                <p class="a3G">-</p>
            <!-- <p class="t4">Pokemon Training</p> -->
                <p class="a4A">Pokemon Stats Paper</p>
                <p class="dD4">10/08/21</p>
                <p class="a4G">-</p>
            <!-- <p class="t5">Items</p> -->
                <p class="a5A">PokeMart Excursion</p>
                <p class="dD5">10/15/21</p>
                <p class="a5G">-</p>
            <!-- <p class="t6">Pokemon Battling Part1</p> -->
                <p class="a6A">Battle Journal</p>
                <p class="dD6">10/22/21</p>
                <p class="a6G">-</p>
            <!-- <p class="t7">Pokemon Battling Part2</p> -->
                <p class="a7A">Battle Video</p>
                <p class="dD7">10/29/21</p>
                <p class="a7G">-</p>
            <!-- <p class="t8">Pokemon Evolution</p> -->
                <p class="a8A">Evolution Path Chart</p>
                <p class="dD8">11/05/21</p>
                <p class="a8G">-</p>
            <!-- <p class="t9">Pokemon Breeding</p> -->
                <p class="a9A">Pokemon Daycare Quiz</p>
                <p class="dD9">11/12/21</p>
                <p class="a9G">-</p>
            <!-- <p class="t10">Pokemon Career Paths</p> -->
                <p class="a10A">I want to be the very best paper</p>
                <p class="dD10">11/19/21</p>
                <p class="a10G">-</p>
        </div>
    </div>
</template>

<script>

export default {
    name: "course-progress",
}
</script>

<style>
.Pokemon101 {
    padding: 20px 0px 0px 40px;
}
.c-container {
    display: grid;
    grid-template-columns: 1fr 1fr 5fr 1fr ;
    grid-template-areas:
    "cN cN pB lG";
    gap: 5px;
    border: 5px double rgb(9, 115, 148);
    margin: 10px;
    padding: 6px 10px 0px 10px;
    border-radius: 10px;
    justify-items: center;
    align-items: center;
}
.cU-container {
    display: grid;
    grid-template-columns: 2fr 2fr 1fr 1fr;
    grid-template-areas:
    "cU cU dD aG"
    /* "t1 t1 t1 t1" */
    "a1A a1A dD1 a1G"
    /* "t2 t2 t2 t2" */
    "a2A a2A dD2 a2G"
    /* "t3 t3 t3 t3" */
    "a3A a3A dD3 a3G"
    /* "t4 t4 t4 t4" */
    "a4A a4A dD4 a4G"
    /* "t5 t5 t5 t5" */
    "a5A a5A dD5 a5G"
    /* "t6 t6 t6 t6" */
    "a6A a6A dD6 a6G"
    /* "t7 t7 t7 t7" */
    "a7A a7A dD7 a7G"
    /* "t8 t8 t8 t8" */
    "a8A a8A dD8 a8G"
    /* "t9 t9 t9 t9" */
    "a9A a9A dD9 a9G"
    /* "t10 t10 t10 t10" */
    "a10A a10A dD10 a10G";  
    gap: 5px;
    border: 5px double rgb(9, 115, 148);
    margin: 10px;
    padding: 16px;
    border-radius: 10px;
    justify-items: left;
}
p {
    color: black;
}
.c {
    grid-area: c;
}
.cN {
     grid-area: cN;
     text-emphasis: bold;
     font-size: 30px;
 }
.cP {
     grid-area: cP;
 }
.cU {
     grid-area: cU;
     text-decoration-line: underline;
 }
.lG {
     grid-area: 1G;
    text-emphasis: bold;
    font-size: 20px;
    padding-right: 15px;
    margin-right: 15px;
}
.t1 {
     grid-area: t1;
 }
.a1A {
     grid-area: a1A;
 }
.a1G {
     grid-area: a1G;
 }
.t2 {
     grid-area: t2;
 }
.a2A {
     grid-area: a2A;
 }
.a2G {
    grid-area: a2G;
}
.t3 {
     grid-area: t3;
 }
.a3A {
     grid-area: a3A;
 }
.a3G {
     grid-area: a3G;
 }
.t4 {
     grid-area: t4;
 }
.a4A {
     grid-area: a4A;
 }
.a4G {
    grid-area: a4G;
}
.t5 {
     grid-area: t5;
 }
.a5A {
     grid-area: a5A;
 }
.a5G {
     grid-area: a5G;
 }
.t6 {
     grid-area: t6;
 }
.a6A {
     grid-area: a6A;
 }
.a6G {
    grid-area: a6G;
}
.t7 {
     grid-area: t7;
 }
.a7A {
     grid-area: a7A;
 }
.a7G {
     grid-area: a7G;
 }
.t8 {
     grid-area: t8;
 }
.a8A {
     grid-area: a8A;
 }
.a8G {
    grid-area: a8G;
}
.t9 {
     grid-area: t9;
 }
.a9A {
     grid-area: a9A;
 }
.a9G {
     grid-area: a9G;
 }
.t10 {
     grid-area: t10;
 }
.a10A {
     grid-area: a10A;
 }
.a10G {
    grid-area: a10G;
}
.dD {
    grid-area: dD;
    text-decoration: underline;
}
.aG {
    grid-area: aG;
    text-decoration: underline;
}
.dD1 {
    grid-area: dD1;
}
.dD2 {
    grid-area: dD2;
}
.dD3 {
    grid-area: dD3;
    color: rgb(214, 40, 40);
    font-weight: 1000;
}
.dD4 {
    grid-area: dD4;
}
.dD5 {
    grid-area: dD5;
}
.dD6 {
    grid-area: dD6;
}
.dD7 {
    grid-area: dD7;
}
.dD8 {
    grid-area: dD8;
}
.dD9 {
    grid-area: dD9;
}
.dD10 {
    grid-area: dD10;
}
 /* {
     grid-area: ;
 } */
</style>