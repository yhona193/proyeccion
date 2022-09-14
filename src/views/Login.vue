<template>
  <div class="container-fluid">
    <div class="row">
      
        <div id="particles-js" class="caja-imagen col-sm-8 px-0 d-none d-sm-block">
          <div class="text-login">
            <div class="texto">
              <h1>RESPONSABILIDAD SOCIAL</h1>
            </div>
          </div>
          <vue-particles 
            color="#ffffff"
            :particleOpacity="0.7"
            :particlesNumber="120"
            shapeType="circle"
            :particleSize="4"
            linesColor="#ffffff"
            :linesWidth="1"
            :lineLinked="true"
            :lineOpacity="0.4"
            :linesDistance="150"
            :moveSpeed="4"
            :hoverEffect="true"
            hoverMode="repulse"
            :clickEffect="true"
            clickMode="push"
          >
        </vue-particles>
        </div>

      <div class="col-sm-4 shadow">
        <div class="hold-transition login-page">
          <div class="wrapper fadeInDown">
            
            <div id="formContent">
              <div class="fadeIn first">
                <img src="@/views/assets/img/template/logoupla6.gif" id="icon" alt="User Icon" />
              </div>
              <form v-on:submit.prevent="login">
                <input type="email" id="login" class="fadeIn second" name="login" placeholder="Usuario"
                  v-model="persEmail" required>
                <input type="password" id="password" class="fadeIn third" name="login" placeholder="Contraseña"
                  v-model="persPassword" required>

                .<div class="container p-4">
                  <div class="alert alert-danger mt-0 mb-1" role="alert" v-if="error">
                    {{ error_msg }}
                  </div>
                  <div class="container-fluid">
                    <button type="submit" class="btn bg-gradient-info mt-2 mb-4">Ingresar</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'login',
  components: {

  },
  data: function () {
    return {
      persEmail: "",
      persPassword: "",
      error: false,
      error_msg: "",
    }
  },
  methods: {
    async login() {

      try {
        let formData = new FormData();
        formData.append('persEmail', this.persEmail);
        formData.append('persPassword', this.persPassword);

        let response = await axios.post('https://apirest.upla.edu.pe/sigedo/persona?login=true&suffix=pers', formData);
          
        console.log(response)

        if (response.data.status == 200) {
          
          // localStorage.token = response.data.results.token;
          // localStorage.datos = response.data.results.docNumId;
          sessionStorage.codigo = response.data.results.docNumId;
          sessionStorage.ApellidoP = response.data.results.persPaterno;
          sessionStorage.ApellidoM = response.data.results.persMaterno;
          sessionStorage.Nombres = response.data.results.persNombre;
          sessionStorage.Rol = response.data.results.persRol;

          this.$router.push('/inicio');

        }

      } catch (error) {
        // this.error = true;
        // this.error_msg = error.response.data.results;
      }

    }
  }

}

</script>


<style scoped>
.login-page {
  background-color: white;

}

.caja-imagen {
  background-image: url(/src/assets/portadapuniversitaria.png);
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  overflow: hidden;
  height: 100vh;
  float: left;
  display: flex;
  justify-content: center;
  align-items: center;
}

.caja-texto {
  text-align: center;
  display: flex;
  align-items: center;
}

.text-login {
  display: flex;
  justify-content: center;
  align-items: center;
}

.texto {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-family: 'Montserrat', sans-serif !important;
  text-align: center;
}

.text-login h1 {
  color: #fff;
  font-size: 2.9rem;
  font-weight: bold;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display: inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display: inline-block;
  margin: 40px 8px 10px 8px;
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  /* -webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
  box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3); */
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button],
input[type=submit],
input[type=reset] {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
  box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover,
input[type=submit]:hover,
input[type=reset]:hover {
  background-color: #39ace7;
}

input[type=button]:active,
input[type=submit]:active,
input[type=reset]:active {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=email] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=email]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=email]:placeholder {
  color: #cccccc;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}

/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@-moz-keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

.fadeIn {
  opacity: 0;
  -webkit-animation: fadeIn ease-in 1;
  -moz-animation: fadeIn ease-in 1;
  animation: fadeIn ease-in 1;

  -webkit-animation-fill-mode: forwards;
  -moz-animation-fill-mode: forwards;
  animation-fill-mode: forwards;

  -webkit-animation-duration: 1s;
  -moz-animation-duration: 1s;
  animation-duration: 1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after {
  width: 100%;
}



/* OTHERS */

*:focus {
  outline: none;
}

#icon {
  width: 60%;
}
</style>