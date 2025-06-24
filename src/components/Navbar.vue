<template>
  <div class="custom-navbar">
    <div class="ui container navbar-content">
      <!-- Logo -->
      <router-link to="/home" class="navbar-title">IE 34007</router-link>

      <!-- Icono hamburguesa -->
      <i class="bars icon menu-toggle" @click="menuVisible = !menuVisible"></i>

      <!-- Menú -->
      <div :class="['navbar-links', { 'show': menuVisible }]">
        <router-link to="/home" class="item" @click="menuVisible = false">Portafolio</router-link>
        <router-link to="/docentes" class="item" @click="menuVisible = false">Docentes</router-link>
        <button class="ui red button logout-button" @click="logout">Cerrar Sesión</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const menuVisible = ref(false)

const logout = () => {
  localStorage.clear()
  router.push('/')
}
</script>

<style scoped>
/* Navbar */
.custom-navbar {
  position: fixed;
  top: 0;
  width: 100%;
  background-color: #1b1c1d;
  padding: 10px 0;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  z-index: 1000;
}

.navbar-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* Título */
.navbar-title {
  color: white;
  font-size: 1.8rem;
  font-weight: bold;
  text-decoration: none;
}

/* Icono hamburguesa oculto en escritorio */
.menu-toggle {
  display: none;
  font-size: 2rem;
  color: white;
  cursor: pointer;
}

/* Menú horizontal */
.navbar-links {
  display: flex;
  align-items: center;
}

.navbar-links .item {
  color: white;
  margin-right: 20px;
  font-size: 1.1rem;
  text-decoration: none;
}

.navbar-links .item:hover {
  color: #2185d0;
  transition: color 0.3s;
}

/* Botón cerrar sesión */
.logout-button {
  background-color: #db2828 !important;
  color: white !important;
}

.logout-button:hover {
  background-color: #a51d1d !important;
  transition: background-color 0.3s;
}

/* Responsive */
@media (max-width: 768px) {
  .navbar-content {
    flex-wrap: wrap; /* 🔥 Esto es la clave para que no se amontone */
  }

  .menu-toggle {
    display: block;
  }

  /* La hamburguesa se queda arriba a la derecha */
  .menu-toggle {
    margin-left: auto;
  }

  /* Menú colapsable */
  .navbar-links {
    display: none;
    flex-direction: column;
    width: 100%;
    margin-top: 10px;
  }

  .navbar-links.show {
    display: flex;
  }

  .navbar-links .item,
  .logout-button {
    margin: 10px 0;
    text-align: center;
  }
}

/* Espacio con el contenido */
body, html {
  padding-top: 70px;
}
</style>
