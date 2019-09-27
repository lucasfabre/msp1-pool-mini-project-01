// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import router from './router';
import 'vuetify/dist/vuetify.min.css';
import 'font-awesome/css/font-awesome.css';
import Vuetify from 'vuetify';
import 'material-design-icons-iconfont/dist/material-design-icons.css';
import './styles/global.css';
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueChartkick from 'vue-chartkick';
import Chart from 'chart.js';
import fullCalendar from 'vue-fullcalendar';
import { setupComponents } from './config/setup-components';
import swatches from 'vue-swatches';
import "vue-swatches/dist/vue-swatches.min.css"
import VueCookies from 'vue-cookies'
import VueApexCharts from 'vue-apexcharts'
import Raphael from 'raphael/raphael'
global.Raphael = Raphael
import VueLocalStorage from 'vue-localstorage'

// JQUERY
global.jQuery = require('jquery')
let jQuery = global.jQuery
window.jQuery = jQuery

Vue.use(VueChartkick, { adapter: Chart });
Vue.component('full-calendar', fullCalendar);
Vue.component('swatches', swatches);
Vue.use(VueAxios, axios);
setupComponents(Vue);
Vue.use(Vuetify);
Vue.config.productionTip = false
Vue.use(VueLocalStorage)
Vue.use(VueCookies)
Vue.use(VueApexCharts)
Vue.component('apexchart', VueApexCharts)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  data: {
    themeColor: '#1D2939',
    userEmail: 'admin@yopmail.com',
    userPassword: '123456'
  }
})
