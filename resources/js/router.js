import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue';
import Contact from './views/Contact.vue';
import Login from './views/Login.vue';
import Register from './views/Register.vue';
import User from './views/User.vue';

const routes = [
    { path: '/', component: Home },
    { path: '/contact-us', component: Contact },
    { path: '/login', component: Login, meta: { requiresGuest: true } },  // Solo accesible para no autenticados
    { path: '/register', component: Register, meta: { requiresGuest: true } }, // Solo accesible para no autenticados
    { path: '/users', component: User, meta: { requiresAuth: true } },  // Requiere autenticación
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

// Guardia de navegación global
router.beforeEach((to, from, next) => {
    const token = localStorage.getItem('token');

    // Verificar si la ruta requiere que el usuario no esté autenticado (requiresGuest)
    if (to.matched.some(record => record.meta.requiresGuest) && token) {
        // Si el usuario está autenticado, redirigir a la página principal
        next('/');
    }
    // Verificar si la ruta requiere autenticación (requiresAuth)
    else if (to.matched.some(record => record.meta.requiresAuth) && !token) {
        // Si no está autenticado, redirigir a la página de login
        next('/login');
    }
    else {
        // Permitir la navegación si no se cumplen las condiciones anteriores
        next();
    }
});

export default router;
