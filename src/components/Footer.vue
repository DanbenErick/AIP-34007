<template>
    <footer class="custom-footer">
      <div class="ui container footer-content">
        <div class="footer-title">
          <h4 class="ui header">Institución Educativa Isabel Alcántara Esteban</h4>
          <p>&copy; {{ new Date().getFullYear() }} Todos los derechos reservados</p>
        </div>
  
        <div class="footer-links">
          <a
            href="https://www.facebook.com/ieisabel.alcantaraesteban/"
            target="_blank"
            rel="noopener noreferrer"
            class="ui circular facebook icon button"
          >
            <i class="facebook f icon"></i>
          </a>
        </div>
      </div>
    </footer>
  </template>
  
  <script setup>
  // No necesita lógica especial
  </script>
  
  <style scoped>
  .custom-footer {
    background-color: #1b1c1d;
    color: white;
    padding: 30px 0;
    margin-top: 50px;
  }
  
  .footer-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap; /* Para que no se rompa en pantallas pequeñas */
  }
  
  .footer-title h4 {
    color: white;
    font-size: 1.5rem;
    margin-bottom: 5px;
  }
  
  .footer-title p {
    color: #bbb;
    font-size: 1rem;
  }
  
  .footer-links {
    display: flex;
    align-items: center;
  }
  
  .footer-links a {
    margin-left: 10px;
    transition: transform 0.3s ease;
  }
  
  .footer-links a:hover {
    transform: scale(1.2);
  }
  
  /* Centrado para móviles */
  @media (max-width: 768px) {
    .footer-content {
      flex-direction: column;
      text-align: center;
    }
  
    .footer-links {
      margin-top: 15px;
    }
  }
  </style>
  