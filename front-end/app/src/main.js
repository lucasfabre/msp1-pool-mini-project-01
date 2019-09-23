// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueLocalStorage from 'vue-localstorage'
import VueCookies from 'vue-cookies'
import Donut from 'vue-css-donut-chart'
import 'vue-css-donut-chart/dist/vcdonut.css'
import VueApexCharts from 'vue-apexcharts'

Vue.config.productionTip = false
Vue.use(VueLocalStorage)
Vue.use(VueCookies)
Vue.use(Donut)
Vue.use(VueApexCharts)
Vue.component('apexchart', VueApexCharts)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
