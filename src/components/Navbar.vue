<template>
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="dropdown menu" data-dropdown-menu>
          <li class="menu-text">Mi Sistema</li>
          <li><router-link to="/home">Home</router-link></li>
          <li><router-link to="/trabajos">Trabajos</router-link></li>
        </ul>
      </div>
      <div class="top-bar-right">
        <button class="button alert small" @click="logout">Cerrar Sesión</button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { useRouter } from 'vue-router'
  
  const router = useRouter()
  
  const logout = () => {
    router.push('/')
  }
  </script>
  
  <style scoped>
  .top-bar {
    margin-bottom: 2rem;
  }
  </style>
  