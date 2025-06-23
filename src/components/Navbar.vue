<template>
  <div class="custom-navbar">
    <div class="ui container navbar-content">
      <!-- Logo o título -->
      <router-link to="/home" class="navbar-title">IE 34007 IAE</router-link>

      <!-- Menú -->
      <div class="navbar-links">
        <router-link to="/home" class="item">Home</router-link>
        <router-link to="/trabajos" class="item">Trabajos</router-link>
      </div>

      <!-- Botón Cerrar Sesión -->
      <button class="ui red button logout-button" @click="logout">Cerrar Sesión</button>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

const logout = () => {
  localStorage.clear()
  router.push('/')
}
</script>

<style scoped>
/* Navbar con fondo oscuro elegante */
.custom-navbar {
  position: fixed;
  top: 0;
  width: 100%;
  background-color: #1b1c1d; /* Gris oscuro tipo navy */
  padding: 10px 0;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Sombra sutil */
  z-index: 1000;
}

/* Contenedor interno con flexbox */
.navbar-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* Título del navbar */
.navbar-title {
  color: white;
  font-size: 1.8rem;
  font-weight: bold;
  text-decoration: none;
}

/* Links */
.navbar-links .item {
  color: white;
  margin-right: 20px;
  font-size: 1.1rem;
  text-decoration: none;
}

.navbar-links .item:hover {
  color: #2185d0; /* Azul primario hover */
  transition: color 0.3s;
}

/* Botón cerrar sesión */
.logout-button {
  background-color: #db2828 !important; /* Rojo Semantic UI */
  color: white !important;
}

.logout-button:hover {
  background-color: #a51d1d !important;
  transition: background-color 0.3s;
}

/* Separación con el contenido para que no lo tape */
body, html {
  padding-top: 60px; /* Altura del navbar + espacio de seguridad */
}
</style>
