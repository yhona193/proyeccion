<template>
    <content-header title="Revision de proyectos registrados" />
    <content>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card card-outline card-info shadow">
                        <div class="card-header">
                            <h3 class="card-title">Proyectos por revisar</h3>
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
                            <div class="container mb-3">
                                <div class="row justify-content-center">
                                    <div class="col-9">
                                        <input v-model="tituloGrupo" type="text" class="form-control" id="inputBusqueda" placeholder="Ingrese el nombre del grupo">
                                        <p class="mt-2">El título es: {{ tituloGrupo }}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="container mb-3">
                                <div class="row justify-content-center">
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="inputBusqueda"
                                            placeholder="Ingrese el nombre del grupo">
                                    </div>
                                    <div class="">
                                        <button type="button" class="btn btn-info mb-2" v-on:click="Buscar()"><i
                                                class="fas fa-search"></i>Buscar</button>
                                    </div>
                                </div>
                            </div> -->
                            <div class="container table-responsive p-0">
                                <table id="tablaDocentes" class="table table-hover">
                                    <thead>
                                        <tr class="bg-info">
                                            <th scope="col">Nº</th>
                                            <th scope="col">Nombre de Grupo</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Observacion</th>
                                            <th scope="col">Proceso</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>LOS SOBREVIVIENTES DE LOS ZOMBIES</td>
                                            <td><button class="btn btn-sm btn-success">Activo</button></td>
                                            <td></td>
                                            <td>Aprobado</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>LOS SOBREVIVIENTES DE LA PANDEMIA</td>
                                            <td><button class="btn btn-sm btn-danger">Observado</button></td>
                                            <td>Asesor no encontrado</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>LOS SOBREVIVIENTES DE LA PANDEMIA</td>
                                            <td><button class="btn btn-sm btn-warning">Inscrito</button></td>
                                            <td></td>
                                            <td>Por revisar</td>
                                            <td>
                                                <button type="button" class="btn btn-success btn-sm mr-1 rounded-circle"
                                                    v-on:click="Editar()"><i
                                                        class='fas fa-download'></i></button>
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
 Modal Editar Docente
 ======================================-->

  <div class="modal fade" id="modalEditarDocente">
    <div class="modal-dialog modal-xl">
      <div class="modal-content bg-dark">
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
export default {
    name: "grupos",
    data() {
        return {
            ListarDocentes: null,
            tituloGrupo: null,
        }
    },
    methods: {
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
    }
}
</script>


