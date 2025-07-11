<template>
  <div>
    <Navbar />

    <!-- Hero Section -->
    <div class="hero-portafolio">
      <div class="overlay"></div>
      <div class="ui container hero-content">
        <h1 class="ui inverted header">Portafolio Estudiantil</h1>
        <h3 class="ui inverted header">Hola, {{ nombreUsuario }}</h3>
      </div>
    </div>

    <div class="ui container" style="margin-top: 20px;">
      <!-- Spinner mientras carga -->
      <div v-if="cargando" class="ui active centered inline loader big" style="margin-top: 50px;"></div>

      <!-- Mensaje si no hay archivos -->
      <div v-if="!cargando && archivos.length === 0" class="ui warning message">
        No se encontraron archivos.
      </div>

      <!-- Sección de Imágenes -->
      <div v-if="imagenes.length > 0 && !cargando">
        <div class="section-header">
          <h2>Imágenes</h2>
          <div class="section-divider"></div>
        </div>

        <div class="ui three stackable cards">
          <div
            v-for="(archivo, index) in imagenes"
            :key="index"
            class="card"
            style="padding: 10px;"
          >
            <LazyLoader :src="rutaCompleta(archivo)" tipo="imagen" />
          </div>
        </div>
      </div>

      <!-- Sección de Videos -->
      <div v-if="videos.length > 0 && !cargando" style="margin-top: 40px;">
        <div class="section-header">
          <h2>Videos</h2>
          <div class="section-divider"></div>
        </div>

        <div class="ui three stackable cards">
          <div
            v-for="(archivo, index) in videos"
            :key="index"
            class="card"
            style="padding: 10px;"
          >
            <LazyLoader :src="rutaCompleta(archivo)" tipo="video" />
          </div>
        </div>
      </div>

      <!-- Sección de PDFs -->
      <div v-if="pdfs.length > 0 && !cargando" style="margin-top: 40px;">
        <div class="section-header">
          <h2>Documentos PDF</h2>
          <div class="section-divider"></div>
        </div>

        <div class="ui three stackable cards">
          <div
            v-for="(archivo, index) in pdfs"
            :key="index"
            class="card"
            style="padding: 10px;"
          >
            <LazyLoader :src="rutaCompleta(archivo)" tipo="pdf" />
          </div>
        </div>
      </div>
    </div>

    <Footer />
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import Navbar from '../components/Navbar.vue'
import Footer from '@/components/Footer.vue'
import LazyLoader from '../components/LazyLoader.vue'

const nombreUsuario = ref('')
const archivos = ref([])
const carpetaUsuario = ref('')
const cargando = ref(true)

const esImagen = (archivo) => archivo.match(/\.(jpg|jpeg|png|gif)$/i)
const esVideo = (archivo) => archivo.match(/\.(mp4|webm|ogg)$/i)
const esPDF = (archivo) => archivo.match(/\.pdf$/i)

const imagenes = computed(() => archivos.value.filter(archivo => esImagen(archivo)))
const videos = computed(() => archivos.value.filter(archivo => esVideo(archivo)))
const pdfs = computed(() => archivos.value.filter(archivo => esPDF(archivo)))

const rutaCompleta = (archivo) => `/data/${carpetaUsuario.value}/${archivo}`

onMounted(async () => {
  nombreUsuario.value = localStorage.getItem('NOMBRE_COMPLETO') || 'Invitado'
  carpetaUsuario.value = localStorage.getItem('DNI') || '00000000'

  try {
    const response = await fetch(`/data/${carpetaUsuario.value}/index.json`)
    archivos.value = await response.json()
  } catch (error) {
    console.error('Error al cargar archivos', error)
  } finally {
    cargando.value = false
  }
})
</script>

<style scoped>
/* Todo el CSS lo dejamos igual que el tuyo, ya está perfecto y responsive */
.section-header {
  text-align: center;
  margin: 60px 0 30px 0;
}

.section-header h2 {
  font-size: 2.8rem;
  font-weight: bold;
  color: #2185d0;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 10px;
}

.section-divider {
  width: 80px;
  height: 5px;
  background: linear-gradient(90deg, #2185d0, #00c6ff);
  margin: 0 auto;
  border-radius: 5px;
}

.hero-portafolio {
  position: relative;
  background: url('/fondo_2.png') center center no-repeat;
  background-size: cover;
  height: 80vh;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  overflow: hidden;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  z-index: 1;
}

.hero-content {
  position: relative;
  z-index: 2;
}

h1.ui.header {
  font-size: 4rem;
  font-weight: bold;
  color: white !important;
  margin-bottom: 20px;
}

h3.ui.header {
  font-size: 2rem;
  color: white !important;
  margin-top: 0;
}
</style>
