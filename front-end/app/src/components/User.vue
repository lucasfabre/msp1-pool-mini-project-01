<template>
  <div>
    <div id='title'>
      <h1>User</h1>
    </div>
    <div id='bloc'>
      <div id='user'>
        <h1>User</h1>
        <br><br>
        <button type='button' class='loginbutton' v-on:click='updateUser()'>Update User</button>
        <br><br>
        <button type='button' class='loginbutton' v-on:click='clock()'>Clock !</button>
        <br><br>
      </div>
      <div id='graphs'>
        <h1></h1>
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
          updateUser: {
            email: '',
            password: ''
          },
          clock: {
            status: '',
          }
        }
      }
    },
    methods: {
      updateUser: function () {
        this.$router.push({path: '/update'})
      },
      clock () {
        const headers = {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        }
        if (this.input.clock.status == false) {
          this.input.clock.status=true
        }else{
          this.input.clock.status=false
        }
        if (this.input.clock.email !== '' && this.input.clock.password !== '') {
          axios.post('http://ec2-18-218-129-108.us-east-2.compute.amazonaws.com:4000/api/clocks?status=' + this.input.clock.status, {
            headers: headers
          }).then((res) => {}
          ).catch((err) => {
            console.error(err)
          })
        } else {
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
