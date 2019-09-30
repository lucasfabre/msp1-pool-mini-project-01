<template>
  <v-app id="signup" class="secondary">
    <v-content>
      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4 lg4>
            <v-card class="elevation-1 pa-3">
              <v-card-text>
                <div class="layout column align-center">
                  <img src="static/favicon.png" alt="Time Manager Login Portal" width="180" height="180">
                  <h1 class="flex my-4 primary--text">Time Manager</h1>
                </div>
                <v-form>
                  <v-text-field
                    name="firstname"
                    label="Firstname"
                    type="text"
                    v-model="firstname"
                    :error="error"
                    :rules="[rules.required]"/>
                  <v-text-field
                    name="lastname"
                    label="Lastname"
                    type="text"
                    v-model="lastname"
                    :error="error"
                    :rules="[rules.required]"/>
                  <v-text-field
                    append-icon="person"
                    name="login"
                    label="E-mail address"
                    type="text"
                    v-model="email"
                    :error="error"
                    :rules="[rules.required]"/>
                  <v-text-field
                    :type="hidePassword ? 'password' : 'text'"
                    :append-icon="hidePassword ? 'visibility_off' : 'visibility'"
                    name="password"
                    label="Password"
                    id="password"
                    :rules="[rules.required]"
                    v-model="password"
                    :error="error"
                    @click:append="hidePassword = !hidePassword"/>
                  <v-text-field
                    :type="hidePassword ? 'retypePassword' : 'text'"
                    :append-icon="hidePassword ? 'visibility_off' : 'visibility'"
                    name="retypePassword"
                    label="Retype your password"
                    id="retypePassword"
                    :rules="[rules.required]"
                    v-model="retypePassword"
                    :error="error"
                    @click:append="hidePassword = !hidePassword"/>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn block color="primary" @click="signUp" :loading="loading">Create account</v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
      <v-snackbar
        v-model="showResult"
        :timeout="2000"
        top>
        {{ result }}
      </v-snackbar>
    </v-content>
  </v-app>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      loading: false,
      firstname: '',
      lastname: '',
      email: '',
      password: '',
      retypePassword: '',
      hidePassword: true,
      error: false,
      showResult: false,
      result: '',
      rules: {
        required: value => !!value || 'Required.'
      }
    }
  },

  methods: {
    signUp() {
      const data = {
        user: {
          'email': this.email,
          'firstname': this.firstname,
          'lastname': this.lastname,
          'password': this.password,
          'roles': 1
        }
      }
      const headers = {
        'Content-Type': 'application/json'
      }
      if (this.email !== '' && this.firstname !== '' && this.lastname !== '' && this.password !== '' && this.retypePassword === this.password) {
        axios.post('/api/sign_up', data, {
          headers: headers
        })
          .then((res) => {
            if (res && res.data && res.data.data) {
              this.$router.push({ name: 'Login' })
            }
            else {
              this.result = "pb"
            }
          })
      }
      else {
        this.error = true;
        this.result = "All fields have to be completed";
        this.showResult = true;
      }
    },
    trigger () {
    	this.$refs.sendReply.click()
    }
  }
}
</script>

<style scoped lang="css">
  #signup {
    height: 50%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    z-index: 0;
  }
</style>
