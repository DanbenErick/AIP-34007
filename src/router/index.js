
import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Home from '../views/Home.vue'
import Docentes from '../views/Docentes.vue'

const routes = [
  { path: '/', name: 'Login', component: Login },
  { path: '/home', name: 'Home', component: Home },
  { path: '/docentes', name: 'Docentes', component: Docentes }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
