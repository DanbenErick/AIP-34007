<template>
  <!-- Fondo fijo -->
  <div class="fondo-login"></div>

  <!-- Grid centrado -->
  <div class="ui middle aligned center aligned grid" style="height: 100vh;">
    <div class="column" style="max-width: 500px;">

      <!-- Contenedor tipo box -->
      <div class="ui raised very padded text container segment">

        <!-- Título centrado -->
        <img src="/ing.jpg" alt="Insignia" style="width: 200px;">

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

      </div>
    </div>
  </div>

  <!-- Alerta personalizada -->
  <CustomAlert
    :visible="alertaVisible"
    :title="alertaTitulo"
    :message="alertaMensaje"
    @close="alertaVisible = false"
  />
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import CustomAlert from '../components/CustomAlert.vue' // Asegúrate de tener el componente

const dni = ref('')
const password = ref('')
const estudiantes = ref([])
const router = useRouter()

// Alertas personalizadas
const alertaVisible = ref(false)
const alertaTitulo = ref('')
const alertaMensaje = ref('')

// Leer el CSV al cargar la página
const cargarEstudiantes = async () => {
  const response = await fetch('/data/estudiantes.csv')
  const csvData = await response.text()
  estudiantes.value = parseCSV(csvData)
}

// Convertir CSV en array de objetos
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
  const usuario = estudiantes.value.find((est) => est.DNI === dni.value)
  if (usuario) {
    alertaTitulo.value = '¡Bienvenido!'
    alertaMensaje.value = usuario.NOMBRE_COMPLETO
    alertaVisible.value = true
    localStorage.setItem('NOMBRE_COMPLETO', usuario.NOMBRE_COMPLETO)
    localStorage.setItem('DNI', usuario.DNI)
    setTimeout(() => {
      router.push('/home')
    }, 1500) // Pequeña pausa para que vea la alerta
  } else {
    alertaTitulo.value = 'Error'
    alertaMensaje.value = 'DNI o contraseña incorrectos'
    alertaVisible.value = true
  }
}
</script>

<style scoped>
body {
  background-color: #f0f0f0;
}

.fondo-login {
  position: fixed;
  background: url('/fondo.png');
  width: 100%;
  height: 100vh;
  background-size: cover;
  background-position: center;
  top: 0;
  left: 0;
  z-index: -1;
}

.ui.raised.segment {
  background-color: white !important;
  border-radius: 15px !important;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important;
}

.ui.header {
  margin-bottom: 30px !important;
}

.ui.message {
  margin-top: 20px !important;
}
</style>
