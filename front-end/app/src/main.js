// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueLocalStorage from 'vue-localstorage'
import VueCookies from 'vue-cookies'
import Donut from 'vue-css-donut-chart'
import 'vue-css-donut-chart/dist/vcdonut.css'

Vue.config.productionTip = false
Vue.use(VueLocalStorage)
Vue.use(VueCookies)
Vue.use(Donut)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

new Vue({
  el: '#app',
  components: {
    apexchart: Dashboard,
  },
  data: {
    series: [44, 55, 13, 33],
    chartOptions: {
      dataLabels: {
        enabled: false
      },

      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: 200
          },
          legend: {
            show: false
          }
        }
      }],
      legend: {
        position: 'right',
        offsetY: 0,
        height: 230,
      }
    }
  },
  methods: {
    appendData: function () {
      var arr = this.series.slice()
      arr.push(Math.floor(Math.random() * (100 - 1 + 1)) + 1)
      this.series = arr
    },

    removeData: function () {
      if (this.series.length === 1) return
      var arr = this.series.slice()
      arr.pop()
      this.series = arr
    },

    randomize: function () {
      this.series = this.series.map(() => {
        return Math.floor(Math.random() * (100 - 1 + 1)) + 1
      })
    },

    reset: function () {
      this.series = [44, 55, 13, 33]
    }
  }
})
