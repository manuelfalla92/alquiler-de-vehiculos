<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top p-3">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">RentCar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <router-link class="nav-link" to="/" exact-active-class="active">Autos Disponibles</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/contact-us" exact-active-class="active">Contáctanos</router-link>
                    </li>
                </ul>

                <!-- Botón de usuario que abre el sidebar -->
                <div v-if="isAuthenticated" class="user-menu d-flex align-items-center" @click="toggleSidebar">
                    <span class="text-white me-3">{{ userName }}</span>
                    <i class="bi bi-person-circle text-white"></i>
                </div>

                <!-- Botones de Iniciar Sesión y Registrarse si no está autenticado -->
                <div v-else class="d-flex">
                    <router-link class="btn btn-outline-light me-2" to="/login">Iniciar Sesión</router-link>
                    <router-link class="btn btn-light" to="/register">Registrarse</router-link>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="sidebar" :class="{ open: showSidebar }">
            <div class="sidebar-content">
                <i class="bi bi-x close-icon" @click="toggleSidebar"></i> <!-- Ícono de cerrar -->

                <h4 class="menu-title">Menú</h4>
                <ul>
                    <li>
                        <router-link to="/alquileres" exact-active-class="active" @click="toggleSidebar">Alquileres</router-link>
                    </li>
                    <li>
                        <router-link to="/vehiculos" exact-active-class="active" @click="toggleSidebar">Vehículos</router-link>
                    </li>
                    <li>
                        <router-link to="/users" exact-active-class="active" @click="toggleSidebar">Usuarios</router-link>
                    </li>
                    <li class="logout-option" @click="logout">Cerrar Sesión</li>
                </ul>
            </div>
        </div>

        <!-- Fondo detrás del sidebar -->
        <div v-if="showSidebar" class="backdrop" @click="closeSidebar"></div>
    </nav>
</template>

<script>
import Swal from 'sweetalert2'; // Importamos SweetAlert para la alerta de cierre de sesión

export default {
    data() {
        return {
            isAuthenticated: false,
            userName: '',
            showSidebar: false
        };
    },
    methods: {
        checkAuthentication() {
            const token = localStorage.getItem('token');
            if (token) {
                this.isAuthenticated = true;
                this.userName = localStorage.getItem('user_name');
            } else {
                this.isAuthenticated = false;
                this.userName = '';
            }
        },
        toggleSidebar() {
            this.showSidebar = !this.showSidebar;
        },
        closeSidebar() {
            this.showSidebar = false;
        },
        logout() {
            localStorage.removeItem('token');
            localStorage.removeItem('user_name');
            this.isAuthenticated = false;
            this.showSidebar = false;

            // Mostramos la alerta de SweetAlert notificando que se cerró sesión
            Swal.fire({
                icon: 'success',
                title: 'Sesión cerrada',
                text: 'Has cerrado sesión correctamente.',
                showConfirmButton: false,
                timer: 1500
            });

            // Redirigir al usuario a la página principal
            this.$router.push('/');
        }
    },
    mounted() {
        this.checkAuthentication();
    }
};
</script>

<style scoped>
/* Estilos generales */
.user-menu {
    cursor: pointer;
    padding: 10px;
    border-radius: 8px;
    transition: background-color 0.3s ease;
}

.user-menu:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

/* Sidebar estilo */
.sidebar {
    position: fixed;
    top: 0;
    right: 0;
    height: 100%;
    width: 280px;
    background-color: #ffffff;
    box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
    z-index: 1050;
    padding: 20px;
    transform: translateX(100%);
    transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.sidebar.open {
    transform: translateX(0);
}

.sidebar-content {
    padding-top: 40px;
    padding-bottom: 20px;
}

.menu-title {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    color: #0D6EFD;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    margin-bottom: 1.2rem;
}

.sidebar ul li a {
    text-decoration: none;
    font-size: 1.1rem;
    color: #333;
    display: block;
    padding: 10px;
    border-radius: 8px;
    transition: background-color 0.3s, color 0.3s;
}

.sidebar ul li a.active {
    background-color: #0D6EFD;
    color: #fff;
}

.sidebar ul li a:hover {
    background-color: #0D6EFD;
    color: #fff;
}

.logout-option {
    color: #dc3545;
    font-weight: bold;
    cursor: pointer;
    padding: 10px;
    border-radius: 8px;
    transition: background-color 0.3s, color 0.3s;
}

.logout-option:hover {
    background-color: #dc3545;
    color: #fff;
}

.backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1040;
}

.close-icon {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 1.5rem;
    cursor: pointer;
    color: #333;
}
</style>
