<template>
  <div>
    <div id='title'>
      <h1 v-if='this.username'>Welcome {{this.username}} !</h1>
    </div>
    <div id='block'>
      <h1 id='title'>Timestamp</h1>
      <br>
      <div id='buttonblock'>
        <button type='button' class='button' v-on:click='clock()'>Let work begin !</button><p v-if="clocknotify">{{ clocknotify }}</p>
      </div>
      <br>
    </div>
    <br>
    <div id='buttonblock'>
      <button type='button' class='button' v-on:click='updatepage()'>Update your account</button>
    </div>
    <br>
    <div id="chart">
      <apexchart ></apexchart>
    </div>
    <div id="chart">
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import moment from 'moment'
/* eslint-disable */

moment.locale('fr')
export default {
  name: 'dashboard',
  data () {
    return {
      datetime: moment().format('LLL'),
      email: '',
      data: {},
      json: {},
      username: '',
      user_id: '',
      clocknotify: '',
      options = {
        chart: {
          height: 380,
          width: "100%",
          type: "line"
        },
        series: [
          {
            name: "Series 1",
            data: [45, 52, 38, 45, 19, 33, 63]
          }
        ],
        xaxis: {
          categories: [
            "01 Jan",
            "02 Jan",
            "03 Jan",
            "04 Jan",
            "05 Jan",
            "06 Jan",
            "07 Jan"
          ]
        }
      },
      chart = new ApexCharts(document.querySelector("#chart"), options)
    }
  },
  methods: {
    getuserinformation () {
      axios.get('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users/0')
        .then((res) => {
          this.json = res.data.data
          this.username = this.json.firstname + ' ' + this.json.lastname
          this.user_id = this.json.id
        })
    },
    clock () {
      const datetime = ''
      this.clocknotify = this.datetime
      if (this.user_id !== '') {
        axios.post('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/clocks/' + this.user_id)
          .then((res) => {
            console.log(res)
            console.log(res.data)
            console.log(res.data.data)
            console.log(res.data.data.length)
            if (res && res.data && res.data && res.data.data.length) {
              console.log('Date and time saved successfully')
            }
            else {
              console.log('Can\'t save date and time')
            }
          })
          .catch((err) => {
            console.error(err)
          })
      }
      else {
        console.log('An user_id must be present')
      }
    },
    updatepage () {
      this.$router.push({path: '/update_account'})
    }
  },
  mounted () {
    this.getuserinformation()
    chart.render()
  }
}
</script>

<style scoped>
</style>
