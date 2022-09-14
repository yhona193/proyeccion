<template>
<div class="wrapper">
    <ModalIdle v-if="isIdle" />
    <!-- <p>Esta Inantivo? - {{ isIdle }}</p> -->
    <navbar />
    <sidebar />

    <div class="content-wrapper">
      <router-view />
    </div>

    <footer class="main-footer">
      <div class="float-right d-none d-sm-block">
        <b>Version</b> 1.0
      </div>
      <strong>Copyright &copy; 2022 <a href="https://upla.edu.pe/">UNIVERSIDAD PERUANA LOS ANDES</a>.</strong>
    </footer>

    <aside class="control-sidebar control-sidebar-dark"></aside>

</div>
</template>

<script>
import ModalIdle from "@/components/ModalIdle.vue";
import Navbar from "./inc/Navbar.vue"
import Sidebar from "./inc/Sidebar.vue"
export default{
    components:{
    Navbar,
    Sidebar,
    ModalIdle,
},
computed: {
    isIdle() {
      return this.$store.state.idleVue.isIdle;
    },
  },

}</script>


<!-- <style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style> -->
