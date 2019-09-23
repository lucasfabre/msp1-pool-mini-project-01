import Vue from 'vue'
import Router from 'vue-router'
import CurrentWeather from '@/components/CurrentWeather'
import SignIn from '@/components/SignIn'
import SignUp from '@/components/SignUp'
import Dashboard from '@/components/Dashboard'
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
      path: '/sign_up',
      name: 'SignUp',
      component: SignUp
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/update_account',
      name: 'UpdateAccount',
      component: UpdateAccount
    }
  ]
})
