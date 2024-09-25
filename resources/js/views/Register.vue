<template>
    <div class="register-container d-flex justify-content-center align-items-center">
        <!-- Superposición oscura -->
        <div class="overlay"></div>

        <div class="register-card shadow-lg">
            <h2 class="text-center mb-4">Regístrate</h2>
            <form @submit.prevent="submitRegister">
                <div class="mb-3">
                    <label for="name" class="form-label">Nombre Completo</label>
                    <input type="text" v-model="form.name" class="form-control" id="name"
                        placeholder="Ingresa tu nombre" />
                    <small v-if="errors.name" class="text-danger">{{ errors.name }}</small>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" v-model="form.email" class="form-control" id="email"
                        placeholder="Ingresa tu correo" />
                    <small v-if="errors.email" class="text-danger">{{ errors.email }}</small>
                </div>

                <!-- Campo de contraseña con icono de ver contraseña -->
                <div class="mb-3 position-relative">
                    <label for="password" class="form-label">Contraseña</label>
                    <input :type="showPassword ? 'text' : 'password'" v-model="form.password" class="form-control" id="password"
                        placeholder="Ingresa tu contraseña" />
                    <small v-if="errors.password" class="text-danger">{{ errors.password }}</small>

                    <i @click="togglePassword" class="toggle-password bi" :class="showPassword ? 'bi-eye' : 'bi-eye-slash'" style="cursor: pointer; position: absolute; right: 10px; top: 35px;"></i>
                </div>

                <!-- Campo de confirmar contraseña con icono de ver contraseña -->
                <div class="mb-3 position-relative">
                    <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                    <input :type="showConfirmPassword ? 'text' : 'password'" v-model="form.confirmPassword" class="form-control" id="confirmPassword"
                        placeholder="Confirma tu contraseña" />
                    <small v-if="errors.confirmPassword" class="text-danger">{{ errors.confirmPassword }}</small>

                    <i @click="toggleConfirmPassword" class="toggle-password bi" :class="showConfirmPassword ? 'bi-eye' : 'bi-eye-slash'" style="cursor: pointer; position: absolute; right: 10px; top: 35px;"></i>
                </div>

                <button type="submit" class="btn btn-primary w-100">Registrarse</button>
            </form>
            <div class="mt-3 text-center">
                <router-link to="/login" class="text-primary">¿Ya tienes cuenta? Inicia Sesión</router-link>
                <br />
                <router-link to="/" class="text-secondary">Atrás</router-link>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';

export default {
    data() {
        return {
            form: {
                name: '',
                email: '',
                password: '',
                confirmPassword: ''
            },
            errors: {},
            showPassword: false,
            showConfirmPassword: false
        };
    },
    methods: {
        async submitRegister() {
            this.errors = {}; // Limpiar errores antes de validar

            // Validación de campos
            if (!this.form.name) {
                this.errors.name = "El nombre es obligatorio.";
            }
            if (!this.form.email) {
                this.errors.email = "El correo electrónico es obligatorio.";
            } else if (!this.validEmail(this.form.email)) {
                this.errors.email = "El formato del correo no es válido.";
            }
            if (!this.form.password) {
                this.errors.password = "La contraseña es obligatoria.";
            }
            if (this.form.password !== this.form.confirmPassword) {
                this.errors.confirmPassword = "Las contraseñas no coinciden.";
            }

            // Si hay errores, no se procede
            if (Object.keys(this.errors).length > 0) {
                return;
            }

            // Enviar los datos al backend
            try {
                const response = await axios.post('/api/register', {
                    name: this.form.name,
                    email: this.form.email,
                    password: this.form.password,
                    password_confirmation: this.form.confirmPassword,
                });

                // Guardar el token y el nombre del usuario en localStorage
                if (response.data.access_token) {
                    localStorage.setItem('token', response.data.access_token);
                    localStorage.setItem('user_name', response.data.user.name);

                    // Mostrar mensaje de éxito con SweetAlert
                    Swal.fire({
                        icon: 'success',
                        title: 'Registro exitoso',
                        text: 'Has sido autenticado automáticamente.',
                        showConfirmButton: true
                    });

                    // Redirigir al usuario a la página principal
                    this.$router.push('/');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'No se pudo autenticar al usuario. Inténtelo de nuevo.'
                    });
                }
            } catch (error) {
                if (error.response && error.response.data.errors) {
                    this.errors = error.response.data.errors; // Manejar errores del backend
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Ocurrió un error al registrar al usuario.'
                    });
                }
            }
        },
        validEmail(email) {
            const re = /\S+@\S+\.\S+/;
            return re.test(email);
        },
        togglePassword() {
            this.showPassword = !this.showPassword;
        },
        toggleConfirmPassword() {
            this.showConfirmPassword = !this.showConfirmPassword;
        }
    }
};
</script>

<style scoped>
/* Contenedor de registro ajustado con min-height */
.register-container {
    min-height: 100vh; /* Ocupa al menos toda la pantalla */
    background-image: url('https://forbes.co/_next/image?url=https%3A%2F%2Fcdn.forbes.co%2F2022%2F05%2FHevolucion-Carro-hidrogeno-1.jpg%3Fv%3D1280720&w=3840&q=75');
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

/* Estilo de la tarjeta de registro */
.register-card {
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

/* Estilos para los mensajes de error */
.text-danger {
    font-size: 0.875rem;
    color: red;
}
</style>
