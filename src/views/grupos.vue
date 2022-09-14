<template>
  <content-header title="Grupos Registrados" />
  <content>
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card card-outline card-info shadow">
            <div class="card-header">
              <button v-on:click="NuevoGrupo()" type="button" class="btn btn-info btn-sm">
                Nuevo Grupo
              </button>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>

            <div class="card-body">
              <div class="p-3 table-responsive">
                <table id="TablaGruposFormados" class="table table-hover">
                  <thead>
                    <tr class="bg-info">
                      <th>N°</th>
                      <th>Nombre de Grupo</th>
                      <th>Modalidad</th>
                      <th>Resolución A.</th>
                      <th>Resolución F.</th>
                      <th>Estado</th>
                      <th>Acciones</th> 
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="grupo in ListarGrupos" :key="grupo.grupId">
                      <td>{{ grupo.grupId}}</td>
                      <td>{{ grupo.grupNombre}}</td>
                      <td>{{ grupo.grupModalidad}}</td>
                      <td>{{ grupo.grupResAcept}}</td>
                      <td>{{ grupo.grupResFin}}</td>
                      <td>
                        <button class="btn  btn-xs mr-2" v-on:click="">
                          <span class="bs-stepper-circle">1</span>
                          <span class="bs-stepper-label">Registro</span>
                        </button>
                      </td>
                      <!-- <td> <div v-if="grupo.grupEst > 0">
                        <button class="btn btn-sm btn-success">Activo</button>
                      </div>
                      <div v-else>
                        <button class="btn btn-sm btn-danger">Observado</button>
                      </div>
                      </td> -->
                      <td> <button class="btn btn-warning btn-sm mr-2 rounded-circle" v-on:click="editar(grupo.grupId)"><i class='fas fa-pencil-alt'></i></button>
                            <button class="btn btn-info btn-sm mr-2 rounded-circle" v-on:click=""><i class='fas fa-upload'></i></button> 
                            <button class="btn btn-success btn-sm mr-2 rounded-circle" v-on:click=""><i class='fas fa-download'></i></button> 
                            <button class="btn btn-danger btn-sm mr-2 rounded-circle" v-on:click="EliminarGrupo(grupo.grupId)"><i class='fas fa-trash'></i></button> 
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer">

            </div>
          </div>
        </div>
      </div>
    </div>
  </content>


  <!--=====================================
 Modal Subir Resolucion
 ======================================-->

</template>

<script>

import axios from 'axios';
import $ from "jquery";

export default {
  name: "grupos",
  data() {
    return {
      ListarGrupos: null,
      tituloGrupo: null,
    }
  },
  methods: {
    editar(id){
      this.$router.push('/editar/' + id);
    },
    tabla(){
      this.$nextTick(() =>{
            $("#TablaGruposFormados").DataTable({
              order: [[0, 'desc']],
              "lengthChange": false,
              "responsive": true,
              "autoWidth": false,
              language: {
              "decimal": ",",
              "thousands": ".",
              "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
              "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
              "infoPostFix": "",
              "infoFiltered": "(filtrado de un total de _MAX_ registros)",
              "loadingRecords": "Cargando...",
              "lengthMenu": "Mostrar _MENU_ registros",
              "paginate": {
                  "first": "Primero",
                  "last": "Último",
                  "next": "Siguiente",
                  "previous": "Anterior"
              },
              "processing": "Procesando...",
              "search": "Buscar:",
              "searchPlaceholder": "Ingrese su búsqueda",
              "zeroRecords": "No se encontraron resultados",
              "emptyTable": "Ningún dato disponible en esta tabla",
              "aria": {
                  "sortAscending":  ": Activar para ordenar la columna de manera ascendente",
                  "sortDescending": ": Activar para ordenar la columna de manera descendente"
              },
              "buttons": {
              "create": "Nuevo",
              "edit": "Cambiar",
              "remove": "Borrar",
              "copy": "Copiar",
              "csv": "CSV",
              "excel": "tabla Excel",
              "pdf": "documento PDF",
              "print": "Imprimir",
              "colvis": "Visibilidad columnas",
              "collection": "Colección",
              "upload": "Seleccione fichero...."
              },
              }
            });
      });
    },

    async getUsers() {
      // let response = await axios.get("http://apiproyeccion.com/grupo");
      let response = await axios.get("https://apirest.upla.edu.pe/proyeccion/grupo");
      console.log(response)
      {
        this.ListarGrupos = response.data.results;
        this.tabla()
      }

    },
    
    async EditarGrupo(id) {
      this.$router.push('/linea')
    },
    NuevoGrupo() {
      this.$router.push('/estudiantes');
    },
    EliminarGrupo(id) {
      try {
        this.$swal.fire({
                title: '¿Estas seguro de eliminar el registro?',
                text: "No podrás revertir esto",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminarlo!'
                }).then((result) => {
                    let url = `https://apirest.upla.edu.pe/proyeccion/grupo?id=${id}&nameId=grupId`;
                    if (result.isConfirmed) {
                    axios.delete(url).then(response =>{
                        console.log(response.data.results);
                        // $('#TablaGruposFormados').DataTable().clear().destroy();
                        $('#TablaGruposFormados').DataTable().destroy();
                        this.getUsers();
                    })
                    this.$swal.fire(
                    'Exito!',
                    'El alumno ha sido eliminado del grupo.',
                    'success'
                    )
                    
                }
                })
      } catch (error) {
        console.log(error)
      }

    }
  },
  mounted: function () {
    this.getUsers();

  }
}

</script>


