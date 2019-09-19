<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
body, html {
  height: 100%;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: yellow;
  background-color: black;
}
#title {
  text-align: center;
}
#rectangle {
  margin-top: 1%;
  margin-bottom: 1%;
  border-radius: 4px;
}
#monselect {
  width: 80%;
  height: 40px;
  text-indent: 1%;
  background-color: white;
  color: grey;
  display: inline-block;
  text-decoration: none;
  font-size: 16px;
  text-align: left;
}
.CurrentWeather {
  margin-top: 2%;
  margin-bottom: 2%;
}
.choice {
  background:gainsboro;
  margin-left: 10%;
  margin-right: 10%;
  position: relative;
  text-align: center;
}
.result {
  background:gainsboro;
  margin-left: 10%;
  margin-right: 10%;
  text-align: center;
}
.home {
  background:none;
  margin-left: 10%;
  margin-right: 10%;
  position: relative;
  text-align: center;
  text-decoration: none;
}
.button {
  text-align: center;
  background-color: #0074D9;
  border: none;
  color: white;
  padding: 15px 32px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
}
.loginbutton
{
  text-align: center;
  background-color: black;
  border: white solid 2px;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  font-weight: bold;
}
.newuserbutton {
  text-align: center;
  background-color: black;
  border: white solid 2px;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  font-weight: bold;
}

</style>
