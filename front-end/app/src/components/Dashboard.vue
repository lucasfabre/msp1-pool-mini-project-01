<template>
  <div>
    <div id='title'>
      <h1 v-if='this.username'>Welcome {{this.username}} !</h1>
    </div>
    <div id='block'>
      <h1 id='title'>Timestamp</h1>
      <br>
      <div id='buttonblock'>
        <button type='button' class='button' v-on:click='workstart()'>Let work begin !</button><p v-if="workstartnotify">{{ workstartnotify }}</p>
        <br><br>
        <button type='button' class='button' v-on:click='workstop()'>The workday is over !</button><p v-if="workstopnotify">{{ workstopnotify }}</p>
      </div>
      <br>
    </div>
    <br>
    <div id='buttonblock'>
      <button type='button' class='button' v-on:click='updatepage()'>Update your account</button>
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
      firstname: '',
      lastname: '',
      role: '',
      password: '',
      workstartnotify: '',
      workstopnotify: ''
    }
  },
  methods: {
    getuserinformation () {
      axios.get('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users/0')
        .then((res) => {
          console.log(res.data.data)
          console.log(this.$cookies)
          this.$cookies.isKey("token")
          this.$cookies.isKey("session_jwt")
          this.$cookies.keys().join("\n"); 
          this.json = res.data.data
          this.username = this.json.firstname + ' ' + this.json.lastname
          this.user_id = this.json.id
        })
    },
    workstart () {
      const token = ''
      const headers = {
        'Authorization': this.token
      }
      this.workstartnotify = this.datetime
      if (this.user_id !== '') {
        axios.post('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/clocks/' + this.user_id, {
          headers: headers
        })
          .then((res) => {
            console.log(res)
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
    workstop () {
      const token = this.token
      const headers = {
        'Authorization': this.token
      }
      this.workstopnotify = this.datetime
      if (this.user_id !== '') {
        axios.post('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/clocks/' + this.user_id, data, {
          headers: headers
        })
          .then((res) => {
            console.log(res)
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
  }
}
</script>

<style scoped>
</style>
