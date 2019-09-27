<template>
  <div>
    <div id='title'>
      <h1>Update your account</h1>
    </div>
    <div id='block'>
      <h1 id='title'>Update</h1>
      <input type='text' class='rectangle' name='firstname' v-model='input.update.firstname' placeholder='First name'/>
      <br><br>
      <input type='text' class='rectangle' name='lastname' v-model='input.update.lastname' placeholder='Last name'/>
      <br><br>
      <input type='text' class='rectangle' name='email' v-model='input.update.email' placeholder='E-mail address'/>
      <br><br>
      <input type='password' class='rectangle' name='password' v-model='input.update.password' placeholder='Password'/>
      <br><br>
      <input type='password' class='rectangle' name='password' v-model='input.update.retypepassword' placeholder='Retype your password'/>
      <br><br>
      <div id='buttonblock'>
        <button type='button' class='button' v-on:click='updateaccount()'>Apply</button>
      </div>
      <br><br>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
/* eslint-disable */

export default {
  name: 'update',
  data () {
    return {
      input: {
        update: {
          firstname: '',
          lastname: '',
          email: '',
          password: '',
          retypepassword: ''
        }
      }
    }
  },
  methods: {
    updateaccount () {
      const data = {
        user: {
          'email': this.input.update.email,
          'firstname': this.input.update.firstname,
          'lastname': this.input.update.lastname,
          'password': this.input.update.password,
          'roles': 1
        }
      }
      const headers = {
        'Content-Type': 'application/json',
      }
      if (this.input.update.firstname !== '' && this.input.update.lastname !== '' && this.input.update.email !== '' && this.input.update.password !== '') {
        axios.put('/api/users', data, {
          headers: headers
        }).then((res) => {
          console.log(res)
          if (res && res.data && res.data && res.data.data.length) {
            console.log('Update succeed')
          } else {
            console.log('Update failed')
          }
        }).catch((err) => {
          console.error(err)
        })
      } else {
        console.log('An e-mail address and password must be present')
      }
    }
  }
}
</script>

<style scoped>
</style>
