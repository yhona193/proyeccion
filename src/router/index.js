import { createRouter, createWebHistory } from 'vue-router'
import MainLayout from '../layouts/MainLayout.vue'
// import Dashboard from '../views/Dashboard.vue'
import Login from "../views/Login.vue"

const routes = [
  {
    path: '/home',
    component: MainLayout,
    children: [
      {
        path:'/inicio',
        name: 'dashboard',
        component: function () {
          return import('../views/Dashboard.vue')
        }
      },
      {
        path: '/about',
        name: 'about',
        component: function () {
          return import('../views/AboutView.vue')
        }
      },
      {
        path: '/docentes',
        name: 'docentes',
        component: function () {
          return import('../views/docentes.vue')
        }
      },
      {
        path: '/estudiantes',
        name: 'estudiantes',
        component: function () {
          return import('../views/estudiantes.vue')
        }
      },
      {
        path: '/prueba',
        name: 'pruebas',
        component: function () {
          return import('../views/prueba.vue')
        }
      },
      {
        path: '/editar/:id',
        name: 'editars',
        component: function () {
          return import('../views/editar.vue')
        }
      },
      {
        path: '/probando',
        name: 'probando',
        component: function () {
          return import('../views/probando.vue')
        }
      },
      {
        path: '/grupos',
        name: 'grupos',
        component: function () {
          return import('../views/grupos.vue')
        }
      },
      {
        path: '/revision',
        name: 'revision',
        component: function () {
          return import('../views/revision.vue')
        }
      },
      {
        path: '/linea',
        name: 'linea',
        component: function () {
          return import('../views/linea.vue')
        }
      },
      {
        path: '/formulario',
        name: 'formulario',
        component: function () {
          return import('../views/formulario.vue')
        }
      },
      {
        path: '/alerta',
        name: 'alerta',
        component: function () {
          return import('../views/alerta.vue')
        }
      },
      {
        path: '/particles',
        name: 'particles',
        component: function () {
          return import('../views/particles.vue')
        }
      },
      {
        path: '/jazmin',
        name: 'jazmin',
        component: function () {
          return import('../views/jazmin.vue')
        }
      },
      {
        path: '/jenni',
        name: 'jenni',
        component: function () {
          return import('../views/jenni.vue')
        }
      },

    ]
  },
  {
    path: '/',
    name: 'session',
    component: Login,
  },
  {
    path: '/lockscreen',
    name: 'lockscreen',
    component: function () {
      return import('../views/lockscreen.vue')
    }
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
