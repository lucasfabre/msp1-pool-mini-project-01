<template>
    <div id="app">
      <router-view/>
    </div>
</template>

<script>
/* eslint-disable */
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
  color: grey;
  background-color: white;
}
input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
label {
  text-align: left;
}
#block {
  margin: auto;
  width: 30%;
  color: grey;
  background-color: lightgrey;
  margin-top: 50px;
  padding: 20px;
  border-radius: 6px;
}
#buttonblock {
  text-align: center;
}
#rectangle {
  text-align: left 2px;
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
#title {
  text-align: center;
}
.button {
  text-align: center;
  margin: auto;
  background-color: #0074D9;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  font-size: 16px;
  border-radius: 4px;
  font-weight: bold;
}
.choice {
  background:gainsboro;
  margin-left: 10%;
  margin-right: 10%;
  position: relative;
  text-align: center;
}
.CurrentWeather {
  margin-top: 2%;
  margin-bottom: 2%;
}
.home {
  background:none;
  margin-left: 10%;
  margin-right: 10%;
  position: relative;
  text-align: center;
  text-decoration: none;
}
.result {
  background:gainsboro;
  margin-left: 10%;
  margin-right: 10%;
  text-align: center;
}
</style>
