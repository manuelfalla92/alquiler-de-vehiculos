<template>
    <Header />

    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Listado de Usuarios</h2>
            <button class="btn btn-primary" @click="nuevoUsuario">Nuevo Usuario</button>
        </div>

        <!-- Tabla de usuarios -->
        <div class="table-responsive">
            <table class="table table-hover table-striped align-middle d-none d-lg-table">
                <!-- Ocultar tabla en dispositivos pequeños -->
                <thead class="table-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Email</th>
                        <th scope="col">Fecha de Creación</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in users" :key="user.id">
                        <td>{{ user.id }}</td>
                        <td>{{ user.name }}</td>
                        <td>{{ user.email }}</td>
                        <td>{{ new Date(user.created_at).toLocaleDateString() }}</td>
                        <td>
                            <button class="btn btn-warning btn-sm me-2" @click="editarUsuario(user.id)">
                                <i class="bi bi-pencil"></i> Editar
                            </button>
                            <button class="btn btn-danger btn-sm" @click="eliminarUsuario(user.id)">
                                <i class="bi bi-trash"></i> Eliminar
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Tabla colapsable para dispositivos móviles -->
            <div class="accordion d-lg-none" id="accordionExample">
                <div class="accordion-item" v-for="user in users" :key="user.id">
                    <h2 class="accordion-header" :id="'heading' + user.id">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            :data-bs-target="'#collapse' + user.id" aria-expanded="true"
                            :aria-controls="'collapse' + user.id">
                            {{ user.name }} (ID: {{ user.id }})
                        </button>
                    </h2>
                    <div :id="'collapse' + user.id" class="accordion-collapse collapse"
                        :aria-labelledby="'heading' + user.id" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p><strong>Email:</strong> {{ user.email }}</p>
                            <p><strong>Fecha de Creación:</strong> {{ new Date(user.created_at).toLocaleDateString() }}
                            </p>
                            <div>
                                <button class="btn btn-warning btn-sm me-2" @click="editarUsuario(user.id)">
                                    <i class="bi bi-pencil"></i> Editar
                                </button>
                                <button class="btn btn-danger btn-sm" @click="eliminarUsuario(user.id)">
                                    <i class="bi bi-trash"></i> Eliminar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mostrar mensaje si no hay usuarios -->
        <p v-if="users.length === 0" class="text-center">No hay usuarios registrados.</p>
    </div>
</template>

<script>
import Header from '../components/Header.vue';
import axios from 'axios';

export default {
    components: {
        Header,
    },
    data() {
        return {
            users: [], // Lista de usuarios
        };
    },
    methods: {
        nuevoUsuario() {
            this.$router.push('/usuarios/nuevo');
        },
        editarUsuario(id) {
            this.$router.push(`/usuarios/${id}/editar`);
        },
        eliminarUsuario(id) {
            if (confirm('¿Estás seguro de que quieres eliminar este usuario?')) {
                axios
                    .delete(`/api/users/${id}`)
                    .then(() => {
                        this.cargarUsuarios();
                    })
                    .catch((error) => {
                        console.error('Error eliminando usuario', error);
                    });
            }
        },
        cargarUsuarios() {
            axios
                .get('/api/users')
                .then((response) => {
                    this.users = response.data;
                })
                .catch((error) => {
                    console.error('Error cargando usuarios', error);
                });
        },
    },
    mounted() {
        this.cargarUsuarios();
    },
};
</script>

<style scoped>
.container {
    padding-top: 50px;
}

/* Estilos personalizados para la tabla */
.table-responsive {
    border-radius: 10px;
    overflow: hidden;
}

.table {
    margin-bottom: 0;
    border-collapse: separate;
    border-spacing: 0;
}

.table th {
    text-align: center;
}

.table th,
.table td {
    padding: 1rem;
    vertical-align: middle;
}

/* Estilos para los botones */
.btn-sm {
    font-size: 0.85rem;
    padding: 0.375rem 0.75rem;
}

/* Iconos */
i.bi {
    margin-right: 5px;
}

/* Responsive */
@media (max-width: 992px) {

    /* Acordeón para la vista móvil */
    .accordion-button {
        background-color: #0d6efd;
        color: #fff;
        font-weight: bold;
    }

    .accordion-button:hover {
        background-color: #004aad;
    }

    .accordion-body {
        background-color: #f9f9f9;
        border-top: 1px solid #ddd;
        padding: 15px;
    }

    .accordion-header {
        border: none;
    }
}
</style>
