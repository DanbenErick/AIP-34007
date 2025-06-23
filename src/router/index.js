
import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Home from '../views/Home.vue'
import Trabajos from '../views/Trabajos.vue'

const routes = [
  { path: '/', name: 'Login', component: Login },
  { path: '/home', name: 'Home', component: Home },
  { path: '/trabajos', name: 'Trabajos', component: Trabajos }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
