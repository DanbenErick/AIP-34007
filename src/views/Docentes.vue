<template>
  <div class="page-background">
    <Navbar />

    <div class="ui container content-wrapper">

      <!-- SECCIÓN DOCENTES -->
      <div class="ui huge header page-title">Plana Docente</div>
      <p class="ui lead description">
        A continuación se presenta la lista de docentes registrados en el sistema.
      </p>

      <div class="ui raised segment custom-segment">
        <table class="ui celled striped table">
          <thead>
            <tr>
              <th>Grado</th>
              <th>Sección</th>
              <th>Nombre Completo</th>
              <th>Celular</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(docente, index) in docentes" :key="index">
              <td>{{ docente.grado }}</td>
              <td>{{ docente.seccion }}</td>
              <td>{{ docente.nombre }}</td>
              <td>{{ docente.celular }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- SECCIÓN ADMINISTRATIVOS -->
      <div class="ui huge header page-title" style="margin-top: 60px;">Plana Administrativa</div>
      <p class="ui lead description">
        A continuación se presenta la lista del personal administrativo registrado en el sistema.
      </p>

      <div class="ui raised segment custom-segment">
        <table class="ui celled striped table">
          <thead>
            <tr>
              <th>Área</th>
              <th>Nombre Completo</th>
              <th>Celular</th>
              <th>Cargo</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(personal, index) in administrativos" :key="index">
              <td>{{ personal.area }}</td>
              <td>{{ personal.nombre }}</td>
              <td>{{ personal.celular }}</td>
              <td>{{ personal.cargo }}</td>
            </tr>
          </tbody>
        </table>
      </div>

    </div>
  </div>

  <Footer />
</template>

<script setup>
import { ref } from 'vue'
import Navbar from '../components/Navbar.vue'
import Footer from '@/components/Footer.vue'

// Lista de docentes de ejemplo
const docentes = ref([
  { grado: '1', seccion: 'A', nombre: 'Erick Barreto', celular: '999555888' },
  { grado: '1', seccion: 'A', nombre: 'Valery Flores', celular: '999555888' },
  { grado: '1', seccion: 'A', nombre: 'Lian Quispe', celular: '999555888' },
  { grado: '1', seccion: 'A', nombre: 'Astrid Falcon', celular: '999555888' }
])

// Lista de personal administrativo de ejemplo
const administrativos = ref([
  { area: 'Secretaría', nombre: 'Pedro Vargas', celular: '999555777', cargo: 'Secretario' },
  { area: 'Dirección', nombre: 'Laura García', celular: '999666888', cargo: 'Directora' },
  { area: 'Tesorería', nombre: 'Carlos Pérez', celular: '999111222', cargo: 'Tesorero' },
  { area: 'Archivo', nombre: 'María López', celular: '999444555', cargo: 'Archivadora' }
])
</script>

<style scoped>
/* Fondo general */
.page-background {
  min-height: 100vh;
  background-color: #f9f9f9;
  padding-top: 70px; /* Para que no lo tape el navbar */
}

/* Contenedor principal */
.content-wrapper {
  padding: 40px 20px;
}

/* Título grande */
.page-title {
  font-size: 3rem;
  color: #2185d0;
  margin-bottom: 10px;
}

/* Descripción */
.description {
  font-size: 1.2rem;
  color: #555;
  margin-bottom: 30px;
}

/* Tabla dentro de un segmento con sombra */
.custom-segment {
  padding: 20px !important;
  border-radius: 12px !important;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1) !important;
  background-color: white !important;
  margin-bottom: 60px;
}

/* Tabla refinada */
.ui.table {
  border-radius: 10px;
}

.ui.table thead th {
  background-color: #2185d0 !important;
  color: white !important;
  text-align: center;
}

.ui.table tbody tr:hover {
  background-color: #f1f1f1 !important;
  cursor: pointer;
}

.ui.table tbody td {
  text-align: center;
}
</style>
