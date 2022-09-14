<template>
<div class="caja">
    <div class="lockscreen-wrapper">
        <div class="lockscreen-logo">
            <a class="text-white"><b class="text-white">UPLA</b ><br>Responsabilidad Social</a>
        </div>
        <div class="lockscreen-name text-center text-white">
            {{ this.Nombres }}
        </div>

        <div class="lockscreen-item">

            <div class="lockscreen-image">
                <img src="@/views/assets/img/template/docentes/default/default.png" alt="User Image">
            </div>

            <form class="lockscreen-credentials">
                <div class="input-group">
                    <input type="password" class="form-control" placeholder="password">

                    <div class="input-group-append">
                        <button type="button" class="btn">
                            <i class="fas fa-arrow-right text-muted"></i>
                        </button>
                    </div>
                </div>
            </form>

        </div>
        <div class="help-block text-center text-white">
            Introduce tu contraseña para recuperar tu sesión
        </div>
        <div class="text-center text-white">
            <a class="nav-link" v-on:click="salir()" role="button">
            O inicie sesión como un usuario diferente
            </a>
            
        </div>
        <div class="lockscreen-footer text-center text-white">
            Responsabilidad Social &copy; 2022 <b>
                <br> <a href="https://upla.edu.pe/" class="text-black">UNIVERSIDAD PERUANA LOS ANDES</a>
            </b>
            <br>
            Reservados todos los derechos
        </div>
    </div>
</div>

</template>

<script>


export default {
  data() {
    return {
      Nombres: sessionStorage.getItem('Nombres'),
    }
  },
  methods:{
    modoClaro(){
      var item = document.getElementById("bodyprincipal");
      item.classList.remove('dark-mode');
      localStorage.removeItem('color')
    },
    salir() {
      this.$router.push('/');
      sessionStorage.clear()
      localStorage.clear()
      this.modoClaro()
    },

  }
}
</script>


<style scoped>
.caja {
    background-image: url(/src/assets/portadaproyeccion2.png);
    /* background-color: rgb(207, 207, 207);  */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    overflow: hidden;
    height: 100vh;
}


</style>