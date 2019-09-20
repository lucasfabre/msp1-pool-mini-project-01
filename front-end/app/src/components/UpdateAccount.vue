<template>
  <div>
    <div id='title'>
      <h1>Welcome to TimeManager</h1>
    </div>
    <div id='bloc'>
      <div id='update'>
        <h1>Update</h1>
        <input type='text' class='rectangle' name='firstname' v-model='input.update.firstname' placeholder='First name'/>
        <br><br>
        <input type='text' class='rectangle' name='lastname' v-model='input.update.lastname' placeholder='Last name'/>
        <br><br>
        <input type='text' class='rectangle' name='email' v-model='input.update.email' placeholder='E-mail address'/>
        <br><br>
        <input type='password' class='rectangle' name='password' v-model='input.update.password' placeholder='Password'/>
        <br><br>
        <input type='password' class='rectangle' name='password' v-model='input.update.password' placeholder='Password'/>
        <br><br>
        <button type='button' class='updatebutton' v-on:click='updateaccount()'>Apply</button>
        <br><br>
      </div>
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
            password: ''
          }
        }
      }
    },
    methods: {
      updateaccount () {
        const data = {
          user: {
            'firstname': this.input.update.firstname,
            'lastname': this.input.update.firstname,
            'email': this.input.update.email,
            'password': this.input.update.password
          }
        }
        const headers = {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }
        if (this.input.update.firstname !== '' && this.input.update.lastname !== '' && this.input.update.email !== '' && this.input.update.password !== '') {
          axios.post('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users', data, {
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
  #bloc {
    text-align: center;
    margin: auto;
  }

  #update {
    text-align: center;
    color: black;
    width: 500px;
    background-color: yellow;
    margin: auto;
    margin-top: 50px;
    padding: 20px;
    border-radius: 6px;
  }
  input {
    border-radius: 4px;
    border: none;
    padding: 10px 16px;
    width: 80%;
  }

  #bloc {
    display: flex;
  }
</style>
