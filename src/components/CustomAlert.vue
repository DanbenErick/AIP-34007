<template>
    <div v-if="visible" class="alert-overlay">
      <div class="alert-box scale-up">
        <h3 class="alert-title">{{ title }}</h3>
        <p class="alert-message">{{ message }}</p>
        <button class="ui primary button" @click="closeAlert">Aceptar</button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { defineProps, defineEmits } from 'vue'
  
  const props = defineProps({
    title: { type: String, default: 'Alerta' },
    message: { type: String, default: 'Este es un mensaje de alerta.' },
    visible: { type: Boolean, default: false }
  })
  
  const emit = defineEmits(['close'])
  
  const closeAlert = () => {
    emit('close')
  }
  </script>
  
  <style scoped>
  /* Fondo oscuro del modal */
  .alert-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 2000;
  }
  
  /* Caja de alerta */
  .alert-box {
    background-color: white;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
    width: 90%;
    max-width: 400px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
  }
  
  /* Título */
  .alert-title {
    font-size: 1.8rem;
    margin-bottom: 10px;
    color: #2185d0;
  }
  
  /* Mensaje */
  .alert-message {
    font-size: 1.2rem;
    margin-bottom: 20px;
  }
  
  /* Animación de entrada */
  .scale-up {
    animation: scaleUp 0.3s ease;
  }
  
  @keyframes scaleUp {
    from {
      transform: scale(0.7);
      opacity: 0;
    }
    to {
      transform: scale(1);
      opacity: 1;
    }
  }
  </style>
  