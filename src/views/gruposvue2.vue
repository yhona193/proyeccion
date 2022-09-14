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
                  <!-- <td><button type="button" class="btn btn-warning btn-sm mr-1 rounded-circle"
                            v-on:click="EditarGrupo(grupos.grupId)"><i class='fas fa-pencil-alt'></i></button> -->
                          <!-- <button type="button" class="btn btn-danger btn-sm mr-1 rounded-circle"
                                                      v-on:click="EliminarGrupo(grupos.grupId)"><i
                                                          class='fas fa-trash'></i></button> -->
  
                <div class="p-3 table-responsive">
                  <table id="TablaGruposFormados" class="table table-hover">
                    <thead>
                      <tr class="bg-info">
                        <th>N°</th>
                        <th>Nombre de Grupo</th>
                        <th>Nombre de Grupo</th>
                        <th>Estado</th>
                        <!-- <th>Acciones</th> -->
                      </tr>
                    </thead>
                    <tbody>
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
   Modal Editar Grupo
   ======================================-->
  
    <div class="modal fade" id="modalEditarGrupo">
      <div class="modal-dialog modal-xl">
        <div class="modal-content bg-info">
          <div class="modal-header">
            <h4 class="modal-title">Editar Docente</h4>
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button> -->
          </div>
          <form method="post" class="needs-validation" novalidate enctype="multipart/form-data">
  
            <div class="modal-body">
              <div class="row">
                <!--=====================================
                Id docente
              ======================================-->
                <div class="col-sm-6">
                  <div class="form-group mt-2">
                    <label>Código :</label>
                    <input type="text" class="form-control" pattern="[-\\(\\)\\0-9 ]{1,}"
                      onchange="validateRepeat(event,'text','persona','docNumId')" id="docNumId" readonly required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
                <!--=====================================
              Apellido Paterno
              ======================================-->
                <div class="col-sm-6">
                  <div class="form group mt-2">
                    <label>Apellido Paterno :</label>
                    <input type="text" class="form-control" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}"
                      onchange="validateJS(event,'text')" id="persPaterno" required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
              </div>
  
              <div class="row">
                <!--=====================================
              Apellido Materno
              ======================================-->
                <div class="col-sm-6">
                  <div class="form group mt-2">
                    <label>Apellido Materno :</label>
                    <input type="text" class="form-control" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}"
                      onchange="validateJS(event,'text')" id="persMaterno" required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
  
                <!--=====================================
               Nombres
              ======================================-->
                <div class="col-sm-6">
                  <div class="form group mt-2">
                    <label>Nombres :</label>
                    <input type="text" class="form-control" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}"
                      onchange="validateJS(event,'text')" id="persNombre" required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
              </div>
  
              <div class="row">
                <!--=====================================
              Dirección
              ======================================-->
                <div class="col-sm-6">
                  <div class="form-group mt-2">
                    <label>Dirección :</label>
                    <input type="text" class="form-control"
                      pattern='[-\\(\\)\\=\\%\\&\\$\\;\\_\\*\\"\\#\\?\\¿\\!\\¡\\:\\,\\.\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]{1,}'
                      onchange="validateJS(event,'regex')" id="persDireccion" required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
                <!--=====================================
              Correo electrónico
              ======================================-->
                <div class="col-sm-6">
                  <div class="form group mt-2">
                    <label>Correo electrónico :</label>
                    <input type="email" class="form-control"
                      pattern="[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}"
                      onchange="validateRepeat(event,'email','persona','persEmail')" id="persEmail" required>
                    <div class="valid-feedback">Valido.</div>
                    <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
                </div>
              </div>
              <div class="row">
                <!--=====================================
              Contraseña
              ======================================-->
                <!-- <div class="col-sm-6">
                  <div class="form group mt-2">
                      <label>Contraseña :</label>
                      <input
                      type="password"
                      class="form-control"
                      pattern="[#\\=\\$\\;\\*\\_\\?\\¿\\!\\¡\\:\\.\\,\\0-9a-zA-Z]{1,}"
                      onchange="validateJS(event,'pass')"
                      name="persPassword"
                      required
                      >
                      <div class="valid-feedback">Valido.</div>
                      <div class="invalid-feedback">Por favor rellene este campo.</div>
                  </div>
              </div>  -->
                <!--=====================================
              Foto
              ======================================-->
                <!-- <div class="col-sm-6">
                  <div class="form group mt-2">
                      <label>Imagen :</label>
                      <div class="custom-file">
                          <input
                          type="file"
                          id="customFile"
                          class="custom-file-input"
                          accept="image/*"
                          onchange="validateImageJS(event,'changePicture')"
                          name="imagen"
                          required>
  
                          <div class="valid-feedback">Valido.</div>
                          <div class="invalid-feedback">Por favor rellene este campo.</div>
  
                          <label for="customFile" class="custom-file-label">Elija el archivo</label>
  
                      </div>
                  </div>
              </div>                        -->
                <!--=====================================
                Celular
                ======================================-->
                <div class="col-sm-6">
                  <div class="form group mt-2">
                    <label>Celular :</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                      </div>
                      <input type="text" class="form-control" data-inputmask='"mask": "999 999 999"' data-mask
                        pattern="[-\\(\\)\\0-9 ]{1,}" onchange="validateJS(event,'phone')" id="persCelular" required>
                      <div class="valid-feedback">Valido.</div>
                      <div class="invalid-feedback">Por favor rellene este campo.</div>
                    </div>
                  </div>
                </div>
              </div>
  
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-outline-light" id="btnGuardar" v-on:click="Guardar()">Guardar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
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
      holasa(){
        alert('heelo')
      },
      getUsers() {
        axios.get("http://aplicaciones.upla.edu.pe:41000/grupo")
          .then(function (response)  {
            let tabla1 = $("#TablaGruposFormados").DataTable({
              order: [[0, 'desc']],
              // dom: "Bfrtip",
              // buttons: ["excel", "print", "csv"],
              // buttons: ["copy", "csv", "excel", "print"],
              "lengthChange": false,
              "responsive": true,
              "autoWidth": false,
              data: response.data.results,
              columns: [
                { data: "grupId" },
                { data: "grupNombre" },
                { data: "grupModalidad" },
                { data: "grupEst",
                  "render": function (data, type, row)
                  {
                    if (data=== '1') {
                      return '<button class="btn btn-sm btn-success">Activo</button>';
                    }
                    else {
                      return '<button class="btn btn-sm btn-danger">Observado</button>';
                    }
                  }
                },
                  // {"defaultContent": "<button type='button'class='btn btn-warning btn-sm mr-1 rounded-circle btnEditar'><i class='fas fa-pencil-alt'></i></button>"}
  
              ],
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
  
  
            // $('#TablaGruposFormados tbody').on('click', 'tr',  () => {
            //   let data = tabla1.row( this ).data();
            //   console.log(data);
            //   alert( data['grupId']);
            //   var cliente = this.holita()
            //   console.log(cliente)
            // } );
          })
          .catch((error) => console.log(error.response));
      },
  
      holita(){
       alert('jaja') 
      },
  
      async EditarGrupo(id) {
        // $('#modalEditarGrupo').modal('show');
        //this.$router.push('/linea/' + id);
        this.$router.push('/linea')
      },
      Alerta(titulo, descripcion, color) {
        $(document).Toasts('create', {
          class: color,
          title: titulo,
          autohide: true,
          delay: 1300,
          body: descripcion
        })
      },
      NuevoGrupo() {
        this.$router.push('/estudiantes');
      },
      async EliminarGrupo(id) {
        try {
          let response = await axios.delete(`http://aplicaciones.upla.edu.pe:41000/grupo?id=${id}&nameId=grupId`);
          alert('correcto')
          location.reload()
        } catch (error) {
          this.error = true;
          this.error_msg = error.response.data.results;
        }
  
      }
    },
    mounted: function () {
      this.getUsers();
  
    }
  }
  
  </script>
  
  
  