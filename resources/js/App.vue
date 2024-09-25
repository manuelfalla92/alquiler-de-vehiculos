<template>
    <div class="content">
        <router-view></router-view>
    </div>
</template>

<script>
export default {};
</script>

<style>
/* Asegura que haya espacio para el navbar fijo */
.content {
    /* Ajusta el valor según la altura del navbar fijo */
    min-height: 100vh;
    /* Asegura que el contenido ocupe al menos la altura de la pantalla */
    overflow-y: auto;
    /* Asegura que haya barra de desplazamiento si el contenido lo requiere */
}

/* Estilizando la barra de desplazamiento */
::-webkit-scrollbar {
    width: 10px;
    /* Ancho de la barra de desplazamiento */
}

::-webkit-scrollbar-track {
    background-color: #f1f1f1;
    /* Color de fondo del área de la barra */
    border-radius: 10px;
    /* Redondeando los bordes */
}

::-webkit-scrollbar-thumb {
    background-color: #0D6EFD;
    /* Color de la barra (azul primario de la app) */
    border-radius: 10px;
    /* Bordes redondeados de la barra */
    border: 2px solid #f1f1f1;
    /* Un borde blanco alrededor para dar un efecto elegante */
}

::-webkit-scrollbar-thumb:hover {
    background-color: #004aad;
    /* Color más oscuro cuando se pasa el cursor */
}

/* Soporte para Firefox */
body {
    scrollbar-width: thin;
    scrollbar-color: #0D6EFD #f1f1f1;
}
</style>