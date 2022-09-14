import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ContentHeader from './components/ContentHeader.vue'
import Content from './components/Content.vue'
import VueAxios from 'vue-axios'
import Axios from 'axios'
import IdleVue from "idle-vue";
import Vuex from "vuex";

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import Particles from "particles.vue3";
import VueParticles from 'vue-particles'


import "datatables.net-bs4";
import "datatables.net-bs4/css/dataTables.bootstrap4.min.css";
import "jszip";
import "pdfmake";
import "datatables.net-buttons-bs4";
// import "datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css";
import "datatables.net-buttons/js/buttons.colVis";
import "datatables.net-buttons/js/buttons.flash";
import "datatables.net-buttons/js/buttons.html5";
import "datatables.net-buttons/js/buttons.print";


const app = createApp(App)

app.use(Vuex);

app.use(IdleVue, {
    store,
    idleTime: 180000, // 3 seconds,
    startAtIdle: false
  });


app.component('content-header', ContentHeader)
.component('content', Content)
.use(store).use(router).mount('#app')
app.use(VueAxios, Axios)
app.use(Particles)
app.use(VueSweetalert2)
app.use(VueParticles)
// app.use(Vuelidate)
// app.use(window.vuelidate.default)