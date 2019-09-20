<template>
  <div>
    <div id='title'>
      <h1>Welcome to TimeManager</h1>
    </div>
    <div id='bloc'>
      <div id='login'>
        <h1>Sign in</h1>
        <input type='text' class='rectangle' name='email' v-model='input.signin.email' placeholder='E-mail address'/>
        <br><br>
        <input type='password' class='rectangle' name='password' v-model='input.signin.password' placeholder='Password'/>
        <br><br>
        <button type='button' class='loginbutton' v-on:click='signIn()'>Log in</button>
        <br><br>
      </div>
      <div id='newuser'>
        <h1>Sign up</h1>
        <input type='text' class='rectangle' name='firstname' v-model='input.signup.firstname' placeholder='First name'/>
        <br><br>
        <input type='text' class='rectangle' name='lastname' v-model='input.signup.lastname' placeholder='Last name'/>
        <br><br>
        <input type='email' class='rectangle' name='email' v-model='input.signup.email' placeholder='E-mail address'/>
        <br><br>
        <input type='password' class='rectangle' name='password' v-model='input.signup.password' placeholder='Password'/>
        <br><br>
        <input type='password' class='rectangle' name='retypepassword' v-model='input.signup.retypepassword' placeholder='Retype password'/>
        <br><br>
        <button type='button' class='newuserbutton' v-on:click='signUp()'>New user</button>
        <br><br>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  /* eslint-disable */

  export default {
    name: 'Login',
    data () {
      return {
        input: {
          signin: {
            email: '',
            password: ''
          },
          signup: {
            firstname: '',
            lastname: '',
            email: '',
            password: ''
          }
        }
      }
    },
    methods: {
      signIn () {
        const headers = {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }
        if (this.input.signin.email !== '' && this.input.signin.password !== '') {
          axios.get('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users?email=' + this.input.signin.email + '&password=' + this.input.signin.password, {
            headers: headers
          }).then((res) => {
            console.log(res)
            if (res && res.data && res.data && res.data.data.length) {
              console.log('sign in succeed')
            } else {
              console.log('sign in failed')
            }
          }).catch((err) => {
            console.error(err)
          })
        } else {
          console.log('An e-mail address and password must be present')
        }
      },
      signUp () {
        const data = {
          user: {
            'email': this.input.signup.email,
            'firstname': this.input.signup.firstname,
            'lastname': this.input.signup.lastname,
            'password': this.input.signup.password,
            'roles': 1
          }
        }
        const headers = {
          'Content-Type': 'application/json'
        }
        if (this.input.signup.email !== '' && this.input.signup.firstname !== '' && this.input.signup.lastname !== '' && this.input.signup.password !== '' && this.input.signup.retypepassword === this.input.signup.password) {
          axios.post('http://ec2-18-223-111-157.us-east-2.compute.amazonaws.com:4000/api/users', data, {
            headers: headers
          }).then((res) => {
            console.log(res)
            if (res && res.data && res.data && res.data.data.length) {
              console.log('sign up succeed')
            } else {
              console.log('sign up failed')
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

  #login {
    text-align: center;
    color: black;
    width: 500px;
    background-color: yellow;
    margin: auto;
    margin-top: 50px;
    padding: 20px;
    border-radius: 6px;
  }

  #newuser {
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
