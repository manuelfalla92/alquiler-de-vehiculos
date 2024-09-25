<template>
    <Header />

    <div class="container mt-5">
        <h1 class="text-center mb-5">Contáctanos</h1>

        <div class="row justify-content-center align-items-center">
            <!-- Imagen del auto a la izquierda, ocupando más espacio -->
            <div class="col-md-7 mb-4 mb-md-0">
                <div class="image-container">
                    <img :src="carImage" class="img-fluid rounded shadow-lg" alt="Imagen del auto">
                </div>
            </div>

            <!-- Formulario de contacto a la derecha -->
            <div class="col-md-5">
                <div class="card form-card shadow-lg">
                    <div class="card-body">
                        <form @submit.prevent="submitForm">
                            <div class="mb-3">
                                <label for="name" class="form-label">Nombre</label>
                                <input type="text" v-model="form.name" class="form-control" id="name"
                                    placeholder="Ingresa tu nombre" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Correo Electrónico</label>
                                <input type="email" v-model="form.email" class="form-control" id="email"
                                    placeholder="Ingresa tu correo electrónico" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Mensaje</label>
                                <textarea v-model="form.message" class="form-control" id="message" rows="5"
                                    placeholder="Escribe tu mensaje aquí" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Enviar Mensaje</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Header from '../components/Header.vue';

export default {
    components: {
        Header,
    },
    data() {
        return {
            form: {
                name: '',
                email: '',
                message: ''
            },
            carImage: 'https://www.carroya.com/noticias/sites/default/files/entradillas/459918618onixbaja.jpg' // Puedes reemplazar esta URL con la imagen real del auto
        };
    },
    methods: {
        submitForm() {
            alert(`Gracias ${this.form.name}, hemos recibido tu mensaje!`);
        }
    }
};
</script>

<style scoped>
.container {
    padding-top: 50px;
    max-width: 1200px;
}

h1 {
    font-size: 2.5rem;
    color: #333;
    margin-bottom: 3rem;
}

.image-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}

.img-fluid {
    max-width: 100%;
    height: auto;
    object-fit: cover;
    border-radius: 15px;
    transition: transform 0.3s ease;
}

.img-fluid:hover {
    transform: scale(1.05);
    /* Efecto de zoom al pasar el cursor */
}

.form-card {
    border: none;
    border-radius: 15px;
    padding: 20px;
}

.form-label {
    font-weight: bold;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}
</style>
