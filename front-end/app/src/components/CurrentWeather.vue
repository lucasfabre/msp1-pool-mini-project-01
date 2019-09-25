<template>
  <div class='CurrentWeather'>
    <br>
    <div class='choice'>
      <br>
      <h1 id='rectangle'>Où ?</h1>
        <select id='monselect'>
          <option v-for='city in cities' v-bind:value='city.name' v-bind:key='city.name'>
            <router-link v-bind:to='city.path'>{{ city.name }}</router-link>
          </option>
        </select>
      <br><br>
      <button class='button' id='rectangle' v-on:click='ChangeRoute ()'>Météo actuelle</button>
      <br><br>
    </div>
    <br><br>
    <div class='result'>
      <br>
      <h1 id='rectangle'>Météo actuelle à {{ selected_value.name }}</h1>
      <p v-if='json && json.main && json.main.temp'>Température : {{ json.main.temp }}°C</p>
      <p id='rectangle'>Date : {{ date }}</p>
      <br>
    </div>
    <br><br>
    <div class='home'>
     <button class='button' id='rectangle' v-on-click='refresh ()'>Retour à l'accueil</button>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import axios from 'axios'

moment.locale('fr')
export default {
  name: 'CurrentWeather',
  props: {},
  data () {
    return {
      cities: [],
      selected_value: {},
      date: moment().format('LLL'),
      json: {}
    }
  },
  methods:
    {
      ChangeRoute: function () {
        this.selected_value = document.getElementById('monselect').value
        this.selected_value = this.cities.find((city) => city.name.toLowerCase() === this.selected_value.toLowerCase())
        this.$router.push({path: this.selected_value.path})
        this.weatherbytown()
        this.refresh()
      },
      weatherbytown: function () {
        this.cities = [
          {name: 'Bordeaux', path: '/currentweather/bordeaux'},
          {name: 'Lille', path: '/currentweather/lille'},
          {name: 'Nantes', path: '/currentweather/nantes'},
          {name: 'Niort', path: '/currentweather/niort'},
          {name: 'Paris', path: '/currentweather/paris'}
        ]
        const urlCity = this.$route.path.replace('/currentweather/', '')
        this.selected_value = this.cities.find((city) => city.name.toLowerCase() === urlCity.toLowerCase())
        console.log(this.$route.path)
        console.log(this.selected_value)
      },
      refresh: function () {
        axios
          .get('http://api.openweathermap.org/data/2.5/weather?q=' + this.selected_value.name + ',fr&APPID=6da67b11295e1095eb36355e91959356&units=metric')
          .then((resp) => {
            this.json = resp.data
          })
      }
    },
  mounted () {
    this.weatherbytown()
    this.refresh()
  }
}
</script>
<style scoped>
</style>
