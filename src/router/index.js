import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
//import ActivityHall from '../views/ActivityHall.vue';
//import Rest from '../views/Rest.vue';
//import FirstStatusCheck from '../views/FirstStatusCheck.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  /*{
    path: '/rest',
    name: 'Rest',
    component: Rest,
  },
  {
    path: '/activityhall',
    name: 'ActivityHall',
    component: ActivityHall,
  },
  {
    path: '/firststatuscheck',
    name: 'FirstStatusCheck',
    component: FirstStatusCheck,
  },*/
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
