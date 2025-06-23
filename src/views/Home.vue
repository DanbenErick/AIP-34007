<template>
  <div class="home-container">
    <Navbar />
    <h2>Bienvenido al Home</h2>
    <h3>Hola: {{ nombreUsuario }}</h3>

    <div v-if="archivos.length === 0">
      <p>No se encontraron archivos.</p>
    </div>

    <div v-else class="grid-x grid-margin-x">
      <div
        v-for="(archivo, index) in archivos"
        :key="index"
        class="cell small-12 medium-6 large-4 text-center"
        style="margin-bottom: 20px;"
      >
        <!-- Mostrar Imagen -->
        <div v-if="esImagen(archivo)">
          <img :src="rutaCompleta(archivo)" alt="Imagen" style="width: 100%; border-radius: 10px;" />
        </div>

        <!-- Mostrar Video -->
        <div v-if="esVideo(archivo)">
          <video :src="rutaCompleta(archivo)" controls style="width: 100%; border-radius: 10px;"></video>
        </div>

        <!-- Mostrar PDF en iframe -->
        <div v-if="esPDF(archivo)" style="width: 100%; height: 500px;">
          <iframe
            :src="rutaCompleta(archivo)"
            width="100%"
            height="100%"
            style="border: 1px solid #ccc; border-radius: 10px;"
          ></iframe>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import Navbar from '../components/Navbar.vue'

const nombreUsuario = ref('')
const archivos = ref([])
const carpetaUsuario = ref('')

// Detectar tipo de archivo
const esImagen = (archivo) => {
  return archivo.match(/\.(jpg|jpeg|png|gif)$/i)
}

const esVideo = (archivo) => {
  return archivo.match(/\.(mp4|webm|ogg)$/i)
}

const esPDF = (archivo) => {
  return archivo.match(/\.pdf$/i)
}

// Generar ruta completa
const rutaCompleta = (archivo) => {
  return `/data/${carpetaUsuario.value}/${archivo}`
}

onMounted(async () => {
  nombreUsuario.value = localStorage.getItem('NOMBRE_COMPLETO') || 'Invitado'
  carpetaUsuario.value = localStorage.getItem('DNI') || '00000000'

  try {
    const response = await fetch(`/data/${carpetaUsuario.value}/index.json`)
    archivos.value = await response.json()
  } catch (error) {
    console.error('No se pudo cargar la lista de archivos.', error)
  }
})
</script>

<style scoped>
.home-container {
  padding: 20px;
}

img, video, iframe {
  margin-bottom: 10px;
}
</style>
