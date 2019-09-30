<template>
  <v-container fluid grid-list-xl>
    <div id="workingtime">
      <div id='block'>
        <h1>Timestamp</h1>
        <hr>
        <div id="timestamp">
          <button type='button' class="btn btn-success" v-on:click='clock()'>Clock !</button>
          <br><br>
          <p v-if="workstart">Start time: {{ this.clockstartnotify }}</p>
          <p v-if="workstop">End time: {{ this.clockstopnotify }}</p>
          <p v-if="timeWorked">Time worked (hh:mm:ss): {{ this.timeWorked }}</p>
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
                currentClock: null,
                workstart: false,
                workstop: false,
                timeWorked: false,
                clockReload: false,
                mondayWorked: 7,
                momentConvertedStart: '',
                momentConvertedStop: ''
            }
        },
        methods: {
            getUserInformation () {
                return new Promise((resolve) => {
                    axios.get('/api/users/0')
                        .then((res) => {
                                if (res && res.data && res.data && res.data.data) {
                                    this.json = res.data.data
                                    this.username = this.json.firstname + ' ' + this.json.lastname
                                    this.user_id = this.json.id
                                    resolve(this.json);
                                }
                                else {
                                    this.$router.push({ name: 'Login' })
                                }
                            }
                        )
                        .catch((err) => {
                            this.$router.push({ name: 'Login' })
                        });
                });
            },
            getWorkingTimes () {
                const start = new Date();
                start.setDate(start.getDate() - 20);
                const end = new Date();
                end.setDate(end.getDate() + 1);
                const bounds = {
                    start: start.toISOString().replace('T', ' ').split('.')[0],
                    end: end.toISOString().replace('T', ' ').split('.')[0]
                };
                axios.get('/api/workingtimes/' + this.user_id + '?start=' + bounds.start + '&end=' + bounds.end)
                    .then((res) => {
                        if (res && res.data && res.data && res.data.data) {
                            this.workingTimes = res.data.data;
                            this.setBarData();
                        }
                    })
            },
            clock () {
                const clockstop = ''
                const clockstart = ''
                const clockstartnotify = ''
                const clockstopnotify = ''
                const startWorkingTime = ''
                const stopWorkingTime = ''
                if (this.clockboolean === 0 && this.clockReload === false) {
                    this.workstart = true
                    this.clockboolean = 1 
                    this.clockstart = moment().format()
                    this.clockstartnotify = moment(this.clockstart).format('MMMM Do YYYY, hh:mm:ss')
                }
                else if (this.clockboolean === 1 && this.clockReload === false) {
                    this.workstop = true
                    this.clockboolean = 0
                    this.clockstop = moment().format()
                    this.clockstopnotify = moment(this.clockstop).format('MMMM Do YYYY, hh:mm:ss')
                    this.timeWorked = moment.utc(moment(this.clockstopnotify, 'MMMM Do YYYY, hh:mm:ss').diff(moment(this.clockstartnotify, 'MMMM Do YYYY, hh:mm:ss'))).format("HH:mm:ss")
                    this.startWorkingTime = this.clockstart.replace('T', ' ').split('+')[0]
                    this.stopWorkingTime = this.clockstop.replace('T', ' ').split('+')[0]
                    const data = {
                        "working_time": {
                            "start": this.startWorkingTime,
                            "end": this.stopWorkingTime
                        }
                    }
                    const headers = {
                        'Content-Type': 'application/json'
                    }
                    axios.post('/api/workingtimes/' + this.user_id, data, {
                        headers: headers
                    })
                        .then((res) => {
                            if (res && res.data && res.data && res.data.data) {
                                this.workingTimes = res.data.data;
                                this.setBarData();
                            }
                        })
                }
                else {
                    this.clockstartnotify = ''
                    this.clockstopnotify = ''
                    this.clockReload = false
                }
            },
            setBarData: function () {

            }
        },
        created () {
            this.getUserInformation()
                .then(() => {
                    this.getWorkingTimes()
                })
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
    margin: auto
  }
</style>
