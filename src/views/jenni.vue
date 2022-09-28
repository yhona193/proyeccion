<template>
    <table id="tablaDocentes" class="table table-hover">
        <thead>
            <tr class="bg-info">
                <th scope="col">Nº</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Nombres</th>
                <th scope="col">Email</th>
                <th scope="col">Dirección</th>
                <th scope="col">Celular</th>
                <th scope="col">Acciones</th>
                <th scope="col">Rol</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="docentes in ListarDocentes">
                <th scope="row">{{ docentes.docNumId }}</th>
                <td>{{ docentes.persPaterno }}</td>
                <td>{{ docentes.persMaterno }}</td>
                <td>{{ docentes.persNombre }}</td>
                <td>{{ docentes.persEmail }}</td>
                <td>{{ docentes.persDireccion }}</td>
                <td>{{ docentes.persCelular }}</td>
                <td>{{ docentes.persRol }}</td>
            </tr>
        </tbody> 
    </table>
    <table id="tablaDocentes" class="table table-hover">
        <thead>
            <tr class="bg-info">
                <th scope="col">Nº</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Nombres</th>
                <th scope="col">Email</th>
                <th scope="col">Dirección</th>
                <th scope="col">Celular</th>
                <th scope="col">Acciones</th>
                <th scope="col">Rol</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="docentes in ListarDocentesEditores">
                <th scope="row">{{ docentes.docNumId }}</th>
                <td>{{ docentes.persPaterno }}</td>
                <td>{{ docentes.persMaterno }}</td>
                <td>{{ docentes.persNombre }}</td>
                <td>{{ docentes.persEmail }}</td>
                <td>{{ docentes.persDireccion }}</td>
                <td>{{ docentes.persCelular }}</td>
                <td>{{ docentes.persRol }}</td>
            </tr>
        </tbody> 
    </table>
    <div class="col-md-6">
        <div class="form-group mt-2">
            <label>Rol :</label>
            <select class="form-control" id="persRol" style="width: 100%;">
                <option>Administrador</option>
                <option>Editor</option>
            </select>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor rellene este campo.</div>
        </div>
    </div>
    <button @click="Guardar()">Guardar</button>
</template>

<script>
import axios from 'axios';
export default {
    data() {
    return {
      ListarDocentes: null,
      ListarDocentesEditores: null
    }
  },
    methods: {
        async Mostrar() {
        try {
            let response = await axios.get("http://aplicaciones.upla.edu.pe:50000/persona?linkTo=persRol&equalTo=Administrador");
            this.ListarDocentes = response.data.results;
        } catch (error) {
            this.error = true;
            this.error_msg = error.response.data.results;
        }
        },
        async MostrarE() {
        try {
            let response = await axios.get("http://aplicaciones.upla.edu.pe:50000/persona?linkTo=persRol&equalTo=Editor");
            this.ListarDocentesEditores = response.data.results;
        } catch (error) {
            this.error = true;
            this.error_msg = error.response.data.results;
        }
        },

        async Guardar() {
            try {
                const params = new URLSearchParams();
                params.append('docNumId', '8384233');
                params.append('persRol', $("#persRol").val());
                let result = await axios.post(`http://aplicaciones.upla.edu.pe:50000/persona`, params);
                console.log(result);
            } catch (error) {
                console.log(error);
            }
        },      
    },
    mounted(){
        this.Mostrar();
        this.MostrarE();
    }
}
</script>


<style scoped>
/* hola */
</style>