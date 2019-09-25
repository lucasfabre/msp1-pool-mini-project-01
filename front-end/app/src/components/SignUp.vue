<template>
  <div>
    <div id='title'>
      <h1>Welcome to TimeManager</h1>
    </div>
    <div id='block'>
      <h1 id='title'>Sign up</h1>
      <br>
      <p><label for="firstname">First name</label><input type='text' class='rectangle' name='firstname' v-model='input.signup.firstname' placeholder='Antoine'/></p>
      <p><label for="lastname">Last name</label><input type='text' class='rectangle' name='lastname' v-model='input.signup.lastname' placeholder='Dupont'/></p>
      <p><label for="email">E-mail address</label><input type='email' class='rectangle' name='email' v-model='input.signup.email' placeholder='exemple@domain.com'/></p>
      <p><label for="pasword">Password</label><input type='password' class='rectangle' name='password' v-model='input.signup.password' placeholder='Password'/></p>
      <p><label for="retypepassword">Retype password</label><input type='password' class='rectangle' name='retypepassword' v-model='input.signup.retypepassword' placeholder='Retype password'/></p>
      <div id='buttonblock'>
        <button type='button' class='button' v-on:click='signUp()'>Create account</button>
      </div>
      <br><br>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
/* eslint-disable */

export default {
  name: 'Signup',
  data () {
    return {
      input: {
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
        })
          .then((res) => {
            console.log(res)
            if (res && res.data && res.data.data) {
              console.log('sign up succeed')
              this.$router.push({path: '/dashboard'})
            }
            else {
              console.log('sign up failed')
            }
          })
          .catch((err) => {
            console.error(err)
          })
      }
      else {
        console.log('An e-mail address and password must be present')
      }
    }
  }
}
</script>

<style scoped>
</style>
