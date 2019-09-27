<template>
  <v-container fluid grid-list-xl>
    <div id="workingtime">
      <div id='block'>
        <h1>Timestamp</h1>
        <hr>
        <div id="timestamp">
          <button type='button' class="btn btn-success" v-on:click='clock()'>Clock !</button>
          <h4 v-if="this.clocknotify"> - {{ this.clocknotify }}</h4>
        </div>
      </div>
      <br>
      <h1>Workingtime</h1>
      <hr><br>
      <div class="workingtime">
        <bar-chart 
          id="bar"
          :data="barData"
          xkey="day"
          ykeys='[ "wor", "ove", "rem", "abs" ]'
          labels='[ "Hours worked", "Overtime", "Remaining hours", "Hours of absence" ]'
          bar-colors='[ "#2ECC40", "#36A2EB", "#FFCE56", "#FF4136" ]'
          grid="true"
          grid-text-weight="bold"
          resize="true">
        </bar-chart>
        <donut-chart
          id="donut"
          :data="donutData"
          colors='[ "#2ECC40", "#36A2EB", "#FFCE56", "#FF4136" ]'
          grid="true"
          resize="true">
        </donut-chart>
      </div>
    </div>
    <div id="absence">
      <h1>Absence</h1>
      <hr>
    </div>
  </v-container>
</template>

<script>
import { DonutChart } from 'vue-morris'
import { BarChart } from 'vue-morris'
import axios from 'axios'
import moment from 'moment'

export default {
  data() {
    return {
      donutData: [
        { label: 'Hours worked', value: 300 },
        { label: 'Overtime', value: 100 },
        { label: 'Remaining hours', value: 50 },
        { label: 'Hours of absence', value: 8 }
      ],
      barData: [
        { "day": "Monday", "wor": 7, "ove": 1, "rem": 0, "abs": 0 },
        { "day": "Tuesday","wor": 7, "ove": 0, "rem": 0, "abs": 0 },
        { "day": "Wednesday", "wor": 6, "ove": 0, "rem": 0, "abs": 1 },
        { "day": "Thursday", "wor": 7, "ove": 1, "rem": 0, "abs": 0 },
        { "day": "Friday", "wor": 4, "ove": 0, "rem": 3, "abs": 0 }
      ],
      email: '',
      data: {},
      json: {},
      username: '',
      user_id: '',
      clockboolean: 0,
      clocknotify: ''
    }
  },
  methods: {
    getuserinformation () {
      axios.get('/api/users/0')
        .then((res) => {
          if (res && res.data && res.data && res.data.data) {
            this.json = res.data.data
            this.username = this.json.firstname + ' ' + this.json.lastname
            this.user_id = this.json.id
          }
          else {
            console.log('Il manque le cookie')
            /*this.$router.push({ name: 'Login' })*/
          }
        }
      )
    },
    clock () {
      this.user_id = '4'
      if (this.user_id !== '') {
        this.clocknotify = moment().format('LLL')
        axios.post('/api/clocks/' + this.user_id)
          .then((resp) => {
            if (resp)
            console.log(resp)
          }
        )
      }
      else {
        console.log('efg')
        /*this.$router.push({ name: 'Login' })*/
      }
      if (this.clockboolean === 0) {
        return createElement('p', 'Started at' + this.clocknotify)
        this.clockboolean = 1
        console.log(this.clockboolean)
      }
      else if (this.clockboolean === 1) {
        return createElement('p', 'Stopped at' + this.clocknotify)
        this.clockboolean = 0
        console.log(this.clockboolean)
      }
    }
  },
  mounted () {
    this.getuserinformation()
  },
  components: {
    'donut-chart': DonutChart, BarChart
  }
}
</script>

<style>
.workingtime {
  display: flex;
  margin: 0 auto;
  width: 80%;
}
#bar {
  width: 800px;
}
#timestamp {
  display: flex;
  flex-basis: 30%;
}
</style>
