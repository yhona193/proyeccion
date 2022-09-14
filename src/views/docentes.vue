<template>
  <content-header title="Docentes" />
  <content>
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">

          <div class="card card-outline card-info shadow">
            <div class="card-header">
              <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalAgregarDocentes">
                Nuevo Grado
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
              .<div class="container table-responsive p-0">
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
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="docentes in ListarDocentes" :key="docentes.docNumId">
                      <th scope="row">{{ docentes.docNumId }}</th>
                      <td>{{ docentes.persPaterno }}</td>
                      <td>{{ docentes.persMaterno }}</td>
                      <td>{{ docentes.persNombre }}</td>
                      <td>{{ docentes.persEmail }}</td>
                      <td>{{ docentes.persDireccion }}</td>
                      <td>{{ docentes.persCelular }}</td>
                      <td><button type="button" class="btn btn-warning btn-sm mr-1 rounded-circle"
                          v-on:click="Editar(docentes.docNumId)"><i class='fas fa-pencil-alt'></i></button>
                        <button type="button" class="btn btn-danger btn-sm mr-1 rounded-circle"
                          v-on:click="Eliminar(docentes.docNumId)"><i class='fas fa-trash'></i></button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>


            <div class="card-footer">
              Footer
            </div>
          </div>
        </div>
      </div>
    </div>

  </content>

  <!--=====================================
 Modal Agregar
 ======================================-->

  <div class="modal fade" id="modalAgregarDocentes">
    <div class="modal-dialog modal-lg">
      <div class="modal-content bg-info">
        <div class="modal-header">
          <h4 class="modal-title">Nuevo Idioma</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
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
                    onchange="validateJS(event,'text')" name="docNumId" readonly required>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>

                </div>
              </div>

              <!--=====================================
            Idioma
            ======================================-->
              <div class="col-sm-6">
                <div class="form group mt-2">
                  <label>Idioma :</label>

                  <select class="form-control select2 changeCountry" name="idioId" required>
                    <option value>Seleccionar Idioma</option>

                    <option value="<?php echo ($key + 1) ?>"></option>

                  </select>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>
            </div>

            <div class="row">
              <!--=====================================
            Nivel de Lectura
            ======================================-->
              <div class="col-md-6">
                <div class="form-group mt-2">
                  <label>Nivel de Lectura :</label>
                  <select class="form-control" name="detIdioLectura" style="width: 100%;">
                    <option>Básico</option>
                    <option>Intermedio</option>
                    <option>Avanzado</option>
                  </select>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>

              <!--=====================================
            Nivel de Conversacion
            ======================================-->
              <div class="col-md-6">
                <div class="form-group mt-2">
                  <label>Nivel de Conversación:</label>
                  <select class="form-control" name="detIdioConver" style="width: 100%;">
                    <option>Básico</option>
                    <option>Intermedio</option>
                    <option>Avanzado</option>
                  </select>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>

            </div>

            <div class="row">
              <!--=====================================
            Nivel de Escritura
            ======================================-->
              <div class="col-md-6">
                <div class="form-group mt-2">
                  <label>Nivel de Escritura:</label>
                  <select class="form-control" name="detIdioEscritura" style="width: 100%;">
                    <option>Básico</option>
                    <option>Intermedio</option>
                    <option>Avanzado</option>
                  </select>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>
              <!--=====================================
             Forma de Aprendizaje
            ======================================-->
              <div class="col-sm-6">
                <div class="form group mt-2">
                  <label>Forma de Aprendizaje :</label>
                  <input type="text" class="form-control"
                    pattern='[-\\(\\)\\=\\%\\&\\$\\;\\_\\*\\"\\#\\?\\¿\\!\\¡\\:\\,\\.\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]{1,}'
                    onchange="validateJS(event,'regex')" name="detIdioForA" required>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>
            </div>

            <div class="row">
              <!--=====================================
             Lengua Materna
            ======================================-->
              <div class="col-md-6">
                <div class="form-group mt-2">
                  <label>Lengua Materna :</label>
                  <select class="form-control" name="detIdioLengua" style="width: 100%;">
                    <option>No</option>
                    <option>Si</option>
                  </select>
                  <div class="valid-feedback">Valido.</div>
                  <div class="invalid-feedback">Por favor rellene este campo.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-outline-light">Guardar</button>
          </div>
        </form>
      </div>
      <!-- /.modal-content -->

    </div>
  </div>


  <!--=====================================
 Modal Editar Docente
 ======================================-->

  <div class="modal fade" id="modalEditarDocente">
    <div class="modal-dialog modal-lg">
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

export default {
  name: "grupos",
  data() {
    return {
      ListarDocentes: null,

    }
  },
  methods: {
    async Mostrar() {
      try {
        let response = await axios.get("https://apirest.upla.edu.pe/Persona");
        this.ListarDocentes = response.data.results;
      } catch (error) {
        this.error = true;
        this.error_msg = error.response.data.results;
      }
    },

    async Editar(id) {

      $('#modalEditarDocente').modal('show');
      try {
        $("#divLoad").css("display", "flex");
        $("#lblLoad").html("Cargando...");
        let result = await axios.get("https://apirest.upla.edu.pe/persona", {
          params: {
            linkTo: "docNumId",
            equalTo: id
          }
        });
        console.log(result.data)
        let data = result.data.results[0];
        $("#docNumId").val(data.docNumId);
        $("#persPaterno").val(data.persPaterno);
        $("#persMaterno").val(data.persMaterno);
        $("#persNombre").val(data.persNombre);
        $("#persDireccion").val(data.persDireccion);
        $("#persEmail").val(data.persEmail);
        $("#persCelular").val(data.persCelular);


        $("#divLoad").css("display", "none");
      } catch (error) {
        console.log(error)
        if (error.response) {
          $("#lblLoad").html("Error de conexión.");
        } else {
          $("#lblLoad").html("Error interno.");
        }
      }

    },

    async Guardar() {
      try {
        $("#divLoad").css("display", "flex");
        $("#lblLoad").html("Cargando...");
        const params = new URLSearchParams();

        var id = $("#docNumId").val();

        // params.append('docNumId', $("#docNumId").val());
        params.append('persPaterno', $("#persPaterno").val());
        params.append('persMaterno', $("#persMaterno").val());
        params.append('persNombre', $("#persNombre").val());
        params.append('persDireccion', $("#persDireccion").val());
        params.append('persEmail', $("#persEmail").val());
        params.append('persCelular', $("#persCelular").val());


        let result = await axios.put(`https://apirest.upla.edu.pe/persona?id=${id}&nameId=docNumId`, params);
        console.log(result);
        this.Alerta('Exito','El registro ha sido editado satisfactoriamente', 'bg-success')

      } catch (error) {
        console.log(error);
      }
      $('#modalEditarDocente').modal('hide');
      this.Mostrar();
    },

    async Eliminar(id) {
      try {
        let response = await axios.delete(`https://apirest.upla.edu.pe/Persona?id=${id}&nameId=docNumId`);
        console.log(response.data.results);

        this.Mostrar();
      } catch (error) {
        this.error = true;
        this.error_msg = error.response.data.results;
      }
    },
    Alerta(titulo,descripcion, color) {
      $(document).Toasts('create', {
        class: color,
        title: titulo,
        autohide: true,
        delay: 1300,
        body: descripcion
      })
  }



  },


  mounted: async function () {
    this.Mostrar();
  }
}
</script>


