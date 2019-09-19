import Vue from 'vue'
import Router from 'vue-router'
import CurrentWeather from '@/components/CurrentWeather'
import SignIn from '@/components/SignIn'
import UpdateAccount from '@/components/UpdateAccount'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/currentweather/:city',
      name: 'City',
      component: CurrentWeather
    },
    {
      path: '/sign_in',
      name: 'SignIn',
      component: SignIn
    },
    {
      path: '/update_account',
      name: 'UpdateAccount',
      component: UpdateAccount
    }
  ]
})
