<template>
    <Header />

    <div class="container mt-5">
        <h1 class="text-center mb-5">Lista de Autos Disponibles para Alquiler</h1>
        <div class="row">
            <div class="col-md-4 mb-4" v-for="car in cars" :key="car.id">
                <div class="card h-100">
                    <img :src="car.imagen_url || 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTar_ouGael5ODlrC1kbFbKLpEPSJtTQqdaIg&s'" class="card-img-top" alt="Imagen del carro" />
                    <div class="card-body">
                        <h5 class="card-title">{{ car.marca }} {{ car.modelo }}</h5>
                        <p class="card-text">Año: {{ car.anio }}</p>
                        <p class="card-text">Precio por día: ${{ car.precio_por_dia }}</p>
                        <button class="btn btn-primary w-100">Alquilar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Header from '../components/Header.vue';

export default {
    components: {
        Header,
    },
    data() {
        return {
            cars: []
        };
    },
    mounted() {
        axios.get('/api/cars').then(response => {
            this.cars = response.data;
        });
    },
};
</script>

<style scoped>
.container {
    padding-top: 50px;
}

/* Ajuste de la imagen para que sea más uniforme */
.card-img-top {
    height: 200px;
    object-fit: cover;
}
</style>
