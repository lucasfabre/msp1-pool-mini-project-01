<template>
  <div>
    <div id='title'>
      <h1>Welcome to TimeManager</h1>
    </div>
    <div id='block'>
      <h1 id='title'>Sign in</h1>
      <br>
      <p><label for="email">E-mail address</label><input type='text' class='rectangle' name='email' v-model='input.signin.email' @keyup.enter='trigger' placeholder='exemple@domain.com'/></p>
      <p><label for="password">Password</label><input type='password' class='rectangle' name='password' v-model='input.signin.password' @keyup.enter='trigger' placeholder='Password'/></p>
      <p v-if="loginnotify">{{ loginnotify }}</p><br>
      <div id='buttonblock'>
        <button type='button' class='button' v-on:click='signIn()'>Log in</button>
        <i @click='enterClicked()' ref='sendReply'></i>
        <br><br>
        <button type='button' class='button' v-on:click='signUp()'>Create new account</button>
        <i @click='enterClicked()' ref='sendReply'></i>
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
        }
      },
      loginnotify: '',
    }
  },
  methods: {
    signIn () {
      const data = {
        'email': this.input.signin.email,
        'password': this.input.signin.password
      }
      const headers = {
        'Content-Type': 'application/json'
      }
      if (this.input.signin.email !== '' && this.input.signin.password !== '') {
        axios.post('/api/sign_in', data, {
          headers: headers
        })
          .then((res) => {
            console.log(res)
            if (res && res.data && res.data.status) {
              this.loginnotify = 'Welcome !'
              console.log('sign in succeed')
              console.log(this.$cookies);
              this.$router.push({path: '/dashboard'})
            }
            else {
              this.loginnotify = 'The e-mail address is unknown'
              console.log('sign in failed')
            }
          })
          .catch((err) => {
            console.error(err)
          })
      }
      else {
        this.loginnotify = 'Your e-mail address and your password must be present'
        console.log('An e-mail address and password must be present')
      }
    },
    enterClicked(){
      this.signIn ()
    },
    trigger () {
    	this.$refs.sendReply.click()
    },
    signUp () {
      this.$router.push({path: '/sign_up'})
    }
  }
}
</script>

<style scoped>
</style>
