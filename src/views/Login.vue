<template>
  <div class="grid-container full vh-100 flex-center">
    <div class="card" style="padding: 2rem; max-width: 400px; width: 100%;">
      <h4 class="text-center">Iniciar Sesión</h4>
      <form @submit.prevent="login">
        <label>DNI
          <input v-model="dni" type="text" placeholder="Ingrese su DNI" required />
        </label>
        <label>Contraseña
          <input v-model="password" type="password" placeholder="Contraseña" required />
        </label>
        <button type="submit" class="button expanded">Entrar</button>
      </form>
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
.vh-100 {
  height: 100vh;
}

.flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.card {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
