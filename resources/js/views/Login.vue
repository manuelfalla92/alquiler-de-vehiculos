<template>
    <div class="login-container d-flex justify-content-center align-items-center">
        <!-- Superposición oscura -->
        <div class="overlay"></div>

        <div class="login-card shadow-lg">
            <h2 class="text-center mb-4">Iniciar Sesión</h2>
            <form @submit.prevent="submitLogin">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" v-model="form.email" class="form-control" id="email" placeholder="Ingresa tu correo" />
                    <small v-if="errors.email" class="text-danger">{{ errors.email }}</small>
                </div>

                <!-- Campo de contraseña con icono de ver contraseña -->
                <div class="mb-3 position-relative">
                    <label for="password" class="form-label">Contraseña</label>
                    <input :type="showPassword ? 'text' : 'password'" v-model="form.password" class="form-control" id="password" placeholder="Ingresa tu contraseña" />
                    <small v-if="errors.password" class="text-danger">{{ errors.password }}</small>

                    <!-- Icono para mostrar u ocultar la contraseña -->
                    <i @click="togglePassword" class="toggle-password bi" :class="showPassword ? 'bi-eye' : 'bi-eye-slash'" style="cursor: pointer; position: absolute; right: 10px; top: 35px;"></i>
                </div>

                <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
            </form>
            <div class="mt-3 text-center">
                <router-link to="/register" class="text-primary">¿No tienes cuenta? Regístrate</router-link>
                <br />
                <router-link to="/" class="text-secondary">Atrás</router-link>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2'; // Importamos SweetAlert

export default {
    data() {
        return {
            form: {
                email: '',
                password: '',
            },
            errors: {},
            showPassword: false // Estado para alternar la visibilidad de la contraseña
        };
    },
    methods: {
        async submitLogin() {
            this.errors = {}; // Limpiar errores antes de la validación

            // Validación básica en el frontend
            if (!this.form.email) {
                this.errors.email = "El correo electrónico es obligatorio.";
            } else if (!this.validEmail(this.form.email)) {
                this.errors.email = "El formato del correo no es válido.";
            }

            if (!this.form.password) {
                this.errors.password = "La contraseña es obligatoria.";
            }

            // Si hay errores, no se procede con el login
            if (Object.keys(this.errors).length > 0) {
                return;
            }

            try {
                const response = await axios.post('/api/login', this.form);

                // Guardar el token y el nombre del usuario en el localStorage
                localStorage.setItem('token', response.data.access_token);
                localStorage.setItem('user_name', response.data.user.name);

                // Mostrar alerta de éxito con SweetAlert
                Swal.fire({
                    icon: 'success',
                    title: 'Inicio de sesión exitoso',
                    showConfirmButton: false,
                    timer: 1500
                });

                // Redirigir al usuario a la página principal
                this.$router.push('/');

                // Refrescar la página para que el header muestre el nombre del usuario
                window.location.reload();
            } catch (error) {
                // Mostrar mensaje de error en SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: 'Error al iniciar sesión',
                    text: 'Las credenciales son incorrectas, por favor intente nuevamente.'
                });
            }
        },
        validEmail(email) {
            const re = /\S+@\S+\.\S+/;
            return re.test(email);
        },
        togglePassword() {
            // Alternar la visibilidad de la contraseña
            this.showPassword = !this.showPassword;
        }
    }
};
</script>

<style scoped>
/* Contenedor de login ajustado a la pantalla completa con imagen de fondo */
.login-container {
    min-height: 100vh; /* Ocupa al menos toda la pantalla */
    background-image: url('https://telemedellin.tv/wp-content/uploads/2023/12/Carro1-1.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed; /* La imagen de fondo se queda fija */
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    padding: 20px;
}

/* Superposición oscura */
.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1;
}

/* Estilo de la tarjeta de login */
.login-card {
    position: relative;
    z-index: 2;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    padding: 30px;
    max-width: 400px;
    width: 100%;
}

/* Estilo del título */
h2 {
    color: #0D6EFD;
    font-weight: bold;
}

/* Estilo del botón */
.btn-primary {
    background-color: #0D6EFD;
    border-color: #0D6EFD;
}

.btn-primary:hover {
    background-color: #004aad;
}

/* Estilo del enlace de registro y atrás */
.text-primary {
    color: #0D6EFD;
}

.text-secondary {
    color: #6c757d;
}

.text-primary:hover,
.text-secondary:hover {
    color: #004aad;
}

/* Icono de ver contraseña */
.toggle-password {
    font-size: 1.2rem;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    margin-top: 15px;
}
</style>
