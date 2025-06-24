<template>
    <div ref="elemento" class="lazy-loader">
      <div v-if="!visible" class="ui active centered inline loader small"></div>
  
      <!-- Imagen -->
      <img v-if="visible && tipo === 'imagen'" :src="src" style="width: 100%; border-radius: 10px;" />
  
      <!-- Video -->
      <video v-if="visible && tipo === 'video'" :src="src" controls style="width: 100%; border-radius: 10px;"></video>
  
      <!-- PDF -->
      <iframe
        v-if="visible && tipo === 'pdf'"
        :src="src"
        width="100%"
        height="400px"
        style="border-radius: 10px; border: 1px solid #ccc;"
      ></iframe>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, onBeforeUnmount } from 'vue'
  
  const props = defineProps({
    src: String,
    tipo: String
  })
  
  const elemento = ref(null)
  const visible = ref(false)
  let observer = null
  
  onMounted(() => {
    observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          visible.value = true
          observer.disconnect()
        }
      })
    })
    observer.observe(elemento.value)
  })
  
  onBeforeUnmount(() => {
    if (observer) observer.disconnect()
  })
  </script>
  
  <style scoped>
  .lazy-loader {
    min-height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  </style>
  