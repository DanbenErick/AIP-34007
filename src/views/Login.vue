<template>
  <!-- Fondo fijo -->
  <div class="fondo-login"></div>

  <!-- Grid centrado -->
  <div class="ui middle aligned center aligned grid" style="height: 100vh;">
    <div class="column" style="max-width: 500px;">

      <!-- Contenedor tipo box -->
      <div class="ui raised very padded text container segment">

        <!-- Título centrado -->
        <h2 class="ui teal header center aligned">
          Iniciar Sesión
        </h2>

        <!-- Formulario -->
        <form class="ui large form" @submit.prevent="login">
          <div class="ui stacked segment">

            <!-- Campo DNI -->
            <div class="field">
              <div class="ui left icon input">
                <i class="user icon"></i>
                <input v-model="dni" type="text" placeholder="Ingrese su DNI" required />
              </div>
            </div>

            <!-- Campo Contraseña -->
            <div class="field">
              <div class="ui left icon input">
                <i class="lock icon"></i>
                <input v-model="password" type="password" placeholder="Contraseña" required />
              </div>
            </div>

            <!-- Botón -->
            <button type="submit" class="ui fluid large teal submit button">Entrar</button>
          </div>
        </form>

        <!-- Mensaje inferior -->
        <div class="ui message center aligned">Sistema de Acceso Personalizado</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const dni = ref('')
const password = ref('')
const estudiantes = ref([])
const router = useRouter()

// Leer el CSV al cargar la página
const cargarEstudiantes = async () => {
  const response = await fetch('/data/estudiantes.csv')
  const csvData = await response.text()
  console.log(parseCSV(csvData))
  estudiantes.value = parseCSV(csvData)
}

// Convertir CSV en un array de objetos
const parseCSV = (csv) => {
  const lines = csv.trim().split('\n')
  const headers = lines[0].split(';')
  return lines.slice(1).map(line => {
    const data = line.split(';')
    let estudiante = {}
    headers.forEach((header, index) => {
      estudiante[header.trim()] = data[index].trim()
    })
    
    return estudiante
  })
}

cargarEstudiantes()

// Validar Login
const login = () => {
  console.log(estudiantes)
  const usuario = estudiantes.value.find((est) => {
    console.log(est.DNI, dni.value)
    return est.DNI === dni.value
  })
  if (usuario) {
    alert(`Bienvenido ${usuario.NOMBRE_COMPLETO}`)
    localStorage.setItem('NOMBRE_COMPLETO', usuario.NOMBRE_COMPLETO)
    localStorage.setItem('DNI', usuario.DNI)
    router.push('/home')
  } else {
    alert('DNI o contraseña incorrectos')
  }
}
</script>

<style scoped>
body {
  background-color: #f0f0f0;
}

.fondo-login {
  position: fixed;
  background: url('/fondo.png'); /* Imagen desde public */
  width: 100%;
  height: 100vh;
  background-size: cover;
  background-position: center;
  top: 0;
  left: 0;
  z-index: -1; /* Fondo detrás del contenido */
}

.ui.raised.segment {
  background-color: white !important; /* Fondo blanco para resaltar */
  border-radius: 15px !important; /* Esquinas redondeadas */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important; /* Sombra suave */
}

.ui.header {
  margin-bottom: 30px !important;
}

.ui.message {
  margin-top: 20px !important;
}
</style>
