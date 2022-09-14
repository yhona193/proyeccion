<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h2 class="text-center">Lista de usuarios</h2>
        <table class="table text-center">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Apellidos</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="persona in arrayPersonas" :key="persona.id"> <!-- Recorremos nuestro array -->
              <td v-text="persona.nombre"></td> <!--En la primera columna mostramos el nombre-->
              <td v-text="persona.apellidos"></td> <!--En la segunda mostramos el apellido-->
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-md-6">
       <div class="form-group">
          <label>Nombre</label>
          <input v-model="nombre" type="text" class="form-control"> <!-- este input estará relacionado con la variable nombre-->

          <label>Apellidos</label>
          <input v-model="apellidos" type="text" class="form-control"><!-- este input estará relacionado con la variable apellidos-->
        </div>
        <button @click="Guardar()" class="btn btn-success">Añadir</button><!--Este botón llama a la función guardar que hemos declarado en la parte script-->
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      arrayPersonas:[],//Array que recorreremos
      nombre : "",//variable nombre que hacer referencia al valor del input
      apellidos:""//variable apellidos que hacer referencia al valor del input
    }
  },
  methods:{
    Guardar(){
      var persona = {nombre:this.nombre, apellidos:this.apellidos} //creamos la variable personas, con la variable nombre y apellidos
      this.arrayPersonas.push(persona);//añadimos el la variable persona al array
      //Limpiamos los campos
      this.nombre = "";
      this.apellidos = "";
      console.log(arrayPersonas);
    },
  }
}
</script>