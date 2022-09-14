<!-- <template>

    <div class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <input type="text" class="form-control" id="inputBusqueda" placeholder="Código de Estudiante">
        </div>
        <button type="button" class="btn btn-info mb-2" v-on:click="Agregar()"><i class="fas fa-plus"></i>
            Agregar</button>
    </div>

    <div v-for="(field, i) in inputs">
        <div class="form-group">
            <input type="text" class="form-control" v-model="field.result">
            <button type="button" class="btn btn-danger mb-2" v-on:click="eliminar(i)"><i class="fas fa-trash"></i>
                Eliminar</button>
        </div>
    </div>

</template>

<script>
export default {
    data() {
        return {
            inputs: [],
        }

    },
    methods: {
        eliminar(i) {
            this.inputs.splice(i, 1);
        },
        Agregar() {
            let codigo = $("#inputBusqueda").val();
            this.inputs.push({ result: codigo })
        }
    }
}
</script> -->

<template>
<form
  id="app"
  @submit="checkForm"
  action="https://vuejs.org/"
  method="post"
  novalidate="true"
>

  <p v-if="errors.length">
    <b>Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">{{ error }}</li>
    </ul>
  </p>

  <p>
    <label for="name">Nombre</label>
    <input
      id="name"
      v-model="name"
      type="text"
      name="name"
    >
  </p>

  <p>
    <label for="email">Correo electrónico</label>
    <input
      id="email"
      v-model="email"
      type="email"
      name="email"
    >
  </p>

  <p>
    <label for="movie">Película favorita</label>
    <select
      id="movie"
      v-model="movie"
      name="movie"
    >
      <option>Star Wars</option>
      <option>Vanilla Sky</option>
      <option>Atomic Blonde</option>
    </select>
  </p>

  <p>
    <input
      type="submit"
      value="Enviar"
    >
  </p>

</form>
</template>

<script>
export default {
    data() {
        return {
            errors: [],
            name: null,
            email: null,
            movie: null
        }

    },
    methods: {
        checkForm: function (e) {
            this.errors = [];

            if (!this.name) {
                this.errors.push("El nombre es obligatorio.");
            }
            if (!this.email) {
                this.errors.push('El correo electrónico es obligatorio.');
            } else if (!this.validEmail(this.email)) {
                this.errors.push('El correo electrónico debe ser válido.');
            }

            if (!this.errors.length) {
                return true;
            }

            e.preventDefault();
        },
        validEmail: function (email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
    }

}
</script>