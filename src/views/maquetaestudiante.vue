<template>
    <content-header title="Formación de Grupos" />
    <content>
      <div class="container-fluid">
        <div class="row">
  
          <div class="col-lg-6 hidden-md hidden-sm hidden-xs">
            <div class="card card-outline card-info shadow">
              <div class="card-header">
                <h3 class="card-title">Buscar Estudiantes</h3>
  
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
  
                </div>
              </div>
  
              <div class="card-body">
  
                <div class="input-group input-group mb-3">
                  <select class="form-control" id="grupModalidad">
                    <option value="Monovalente">Monovalente</option>
                    <option value="Polivalente">Polivalente</option>
                  </select>
                </div>
  
                <div class="input-group mb-3">
                  <input type="text" class="form-control" id="inputBusqueda"
                    placeholder="Ingrese el código del estudiante">
                  <div class="input-group-prepend">
                    <button type="button" class="btn btn-info mb-2" v-on:click="Buscar()"><i class="fas fa-search"></i>
                      Buscar</button>
                  </div>
                </div>
  
                <div class="container table-responsive p-0">
                  <table id="tablaEstudiantes" class="table table-hover">
                    <thead>
                      <tr class="bg-info">
                        <th scope="col">Código</th>
                        <th scope="col">Apellido Paterno</th>
                        <th scope="col">Apellido Materno</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="alumnos in ListarAlumnos" :key="alumnos.Est_Id">
                        <th scope="row">{{ alumnos.Est_Id }}</th>
                        <td>{{ alumnos.Est_Paterno }}</td>
                        <td>{{ alumnos.Est_Materno }}</td>
                        <td>{{ alumnos.Est_Nombre }}</td>
                        <td><button type="button" class="btn btn-success btn-sm mr-1 rounded-circle agregarEstudiante"
                            v-on:click="AgregarGrupo(alumnos.Est_Id)" :disabled="form_submitting"><i
                              class='fas fa-plus'></i></button>
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
  
          <div class="col-lg-6 col-xs-12">
            
              <!-- <div class="card-header">
                <h3 class="card-title">Formación de Grupos</h3>
                <div class="card-tools">
                  
                </div>
              </div> -->
  
              <!-- <div class="card-body">
              </div> -->
  
              <div class="card card-info card-outline card-tabs">
                <div class="card-header p-0 pt-1 border-bottom-0">
                  <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="custom-tabs-three-profile-tab" data-toggle="pill" href="#datosGrupo" role="tab" aria-controls="datosGrupo" aria-selected="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Datos del Grupo</font></font></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="custom-tabs-three-messages-tab" data-toggle="pill" href="#integrantes" role="tab" aria-controls="integrantes" aria-selected="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Integrantes</font></font></a>
                    </li>
                  </ul>
                </div>
                <div class="card-body">
                  <div class="tab-content" id="custom-tabs-three-tabContent">
                    <div class="tab-pane fade active show" id="datosGrupo" role="tabpanel" aria-labelledby="datosGrupo-tab">
                      <div class="row">
                        <!--=====================================
                          TITULO  DE TRBAJO
                          ======================================-->
                          <div class="col-sm-12">
                            <div class="form group mt-2">
                              <label>Número de Grupo :</label>
                              <input type="text" id="grupoNumero" class="form-control">
                            </div>
  
                          </div>
                          
  
                        <div class="col-sm-12">
                          <div class="form group mt-2">
                            
                            <label>Título de Trabajo :</label>
                            <input type="text" id="grupTituProyecto" class="form-control">
                            <!-- <input v-model="titulo" type="text" id="grupTituProyecto" class="form-control"> -->
                          </div>
                        </div>
                      </div>
  
                      <div class="row">
                        <!--=====================================
                          NOMBRE DE GRUPO
                          ======================================-->
                        <div class="col-sm-12">
                          <div class="form group mt-2">
                            <label>Nombre de grupo :</label>
                            <input type="text" id="grupNombre" class="form-control">
                            <!-- <input v-model="nombreGrupo" type="text" id="grupNombre" class="form-control"> -->
                          </div>
                        </div>
                      </div>
  
                      <div class="row">
                        <!--=====================================
                          NOMBRE DE ASESOR
                          ======================================-->
                        <div class="col-sm-12">
                          <div class="form group mt-2">
                            <label>Asesor o Asesores :</label>
                            <input type="text" id="grupAsesor" class="form-control">
                            <!-- <input v-model="asesor" type="text" id="grupAsesor" class="form-control"></input> -->
                          </div>
                        </div>
                      </div>
  
                      <div class="row">
                        <!--=====================================
                          LINEA DE PROYECCION
                          ======================================-->
                        <div class="col-sm-12">
                          <div class="form group mt-2">
                            <label>Linea de proyeccion :</label>
                            <input type="text" id="grupLinProyecto" class="form-control">
                            <!-- <input v-model="lineaProyeccion" type="text" id="grupLinProyecto" class="form-control"> -->
                          </div>
                        </div>
                      </div>
  
                      <div class="row">
                        <!--=====================================
                        Fecha de Inicio 
                        ======================================-->
                        <div class="col-sm-6">
                          <div class="form group mt-2">
                            <label>Fecha de Inicio :</label>
                            <input type="date" id="grupFechInicio" class="form-control">
                            <!-- <input v-model="fechaIni" type="date" id="grupFechInicio" class="form-control"> -->
                          </div>
                        </div>
  
                        <!--=====================================
                        Fecha de Finalización 
                        ======================================-->
  
                        <div class="col-sm-6">
                          <div class="form group mt-2">
                            <label>Fecha de Finalización :</label>
                            <input type="date" id="grupFechFinal" class="form-control">
                            <!-- <input v-model="fechaFin" type="date" id="grupFechFinal" class="form-control"> -->
                          </div>
                        </div>
                      </div>
  
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="form group mt-4">
                            <label>Documentos Adicionales :</label>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkInforme"
                                checked="">
                              <label for="checkInforme" class="custom-control-label">Solicitud dirigida al decano de la facultad</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Constancia de Aceptación del asesor</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Constancia de Compromiso del estudiante</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Constancia de Matricula del estudiante</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Documento de aceptación</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Constancia de Matricula del estudiante</label>
                            </div> 
                            <div class="custom-control custom-checkbox">
                              <input class="custom-control-input custom-control-input-danger" type="checkbox" id="checkDnis"
                                checked="">
                              <label for="checkDnis" class="custom-control-label">Constancia</label>
                            </div>
                          </div>
                        </div>
                      </div>
  
                      <div class="mt-4 mb-2">
                        <button type="button" class="btn btn-success btn-sm btn-block" v-on:click="Guardar()">Guardar Grupo</button> 
                      </div>
  
                      <!-- <div v-if="( !($("#checkDnis").prop('checked')) )">
                        <button type="button" class="btn btn-success btn-sm btn-block" v-on:click="Guardar()">Guardar Grupo</button>
                      </div>
                      <div v-else>
                        Ahora no
                      </div>  -->
  
  
                    </div>
                    <div class="tab-pane fade" id="integrantes" role="tabpanel" aria-labelledby="integrantes-tab">
                      <div class="row">
                        <!--=====================================
                          INTEGRANTES
                          ======================================-->
                        <div class="col-sm-12 mt-4 mb-4">
                          <label>Integrantes :</label>
                          <div v-for="(persona, indice) in personas">
                            <div class="input-group mt-2 align-items-center">
                              <div class="col-11">
                                {{ persona.estId }} , {{ persona.estDni }} , {{ persona.estNombre }}
                              </div>
  
                              <div class="input-group-prepend col-1">
                                <button type="button" class="btn btn-danger btn-sm mr-1 rounded-circle"
                                  v-on:click="eliminarI(indice)"><i class="fas fa-trash"></i></button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
  
                      <div class="mt-2 mb-2">
                        <button type="button" v-on:click="Anexar()" class="btn btn-success btn-sm btn-block">Registrar estudiantes al Grupo</button>
                      </div>
  
                    </div>
                  </div>
                </div>
                <!-- /.card -->
              </div>
  
  
              <div class="card-footer">
                <p v-if="errors.length">
                <div class="alert bg-gradient-danger" role="alert">
                  <b>Por favor corrija los siguientes campos:</b>
                  <ul>
                    <li v-for="error in errors">{{ error }}</li>
                  </ul>
                </div>
  
                </p>
              </div>
            
          </div>
  
        </div>
      </div>
  
    </content>
  </template>
  
  <script>
  import axios from 'axios';
  import useValidate from '@vuelidate/core'
  import { required, email, minLength, sameAs, helpers} from '@vuelidate/validators'
  import { reactive, computed } from 'vue'
  
  export default { 
    name: "grupos",
    data() {
      return {
        ListarAlumnos: null,
        form_submitting: false,
        inputs: [],
        errors: [],
        titulo: null,
        personas: []
        
      }
    },
    
    setup(){
        const state = reactive({
          email: '',
          password: '',
        })
  
        const rules = computed(() => {
          return {
            email: 
            { required , 
              email, 
            },
            password: { required, minLength: minLength(6) }
          }
        })
  
        const v$ = useValidate(rules, state)
  
        return{
          state,
          v$,
        }
      },
  
  
    methods: {
  
      async Mostrar(codigo) {
        try {
          let response = await axios.get(`http://aplicaciones.upla.edu.pe:45000/est_estudiante?linkTo=Est_Id&search=${codigo}`);
          this.ListarAlumnos = response.data.results;
        } catch (error) {
          this.error = true;
          this.error_msg = error.response.data.results;
        }
      },
  
      async AgregarGrupo(id) {
        let response = await axios.get(`http://aplicaciones.upla.edu.pe:45000/est_estudiante?linkTo=Est_Id&search=${id}`);
        this.datosEstudiantes = response.data.results[0];
        this.personas.push({
          estId: this.datosEstudiantes.Est_Id,
          estDni: this.datosEstudiantes.Est_NumDoc,
          estNombre: this.datosEstudiantes.Est_Nombre + " " + this.datosEstudiantes.Est_Paterno + " " + this.datosEstudiantes.Est_Materno
        })
  
      },
      Alerta(icono, titulo, descripcion) {
        this.$swal.fire({
            icon: icono,
            title: titulo,
            text: descripcion,
          })
      },
      async Anexar() {
  
          for (let index = 0; index < this.personas.length; index++) {
  
            var persCodigo = JSON.stringify(this.personas[index].estId).replace(/['"]+/g, '')
            persCodigo = persCodigo.replace(/['"]+/g, '')
            var docNumId = JSON.stringify(this.personas[index].estDni).replace(/['"]+/g, '')
            docNumId = docNumId.replace(/['"]+/g, '')
            var persNombre = JSON.stringify(this.personas[index].estNombre).replace(/['"]+/g, '')
            persNombre = persNombre.replace(/['"]+/g, '')
  
            try {
              const params = new URLSearchParams();
              params.append('persCodigo', persCodigo);
              params.append('docNumId', docNumId);
              params.append('persNombre', persNombre);
              params.append('detGruEst', 1);
              params.append('grupId', $("#grupoNumero").val());
  
              let result = await axios.post(`http://aplicaciones.upla.edu.pe:41000/detallegrupo`, params);
  
            } catch (error) {
              console.log(error);
            }
          }
          this.$swal.fire(
              'Éxito!',
              'Su registro se ingreso correctamente.',
              'success'
          );
        
      },
  
      Buscar() {
        let codigo = $("#inputBusqueda").val();
        this.Mostrar(codigo);
      },
      eliminar(i) {
        this.inputs.splice(i, 1);
      },
      eliminarI(indice) {
        this.personas.splice(indice, 1);
      },
  
      async Guardar() {
  
        try {
  
          const params = new URLSearchParams();
          params.append('grupId', $("#grupoNumero").val());
          params.append('grupTituProyecto', $("#grupTituProyecto").val());
          params.append('grupNombre', $("#grupNombre").val());
          params.append('grupModalidad', $("#grupModalidad").val());
          params.append('grupAsesor', $("#grupAsesor").val());
          params.append('grupLinProyecto', $("#grupLinProyecto").val());
          params.append('grupFechInicio', $("#grupFechInicio").val());
          params.append('grupFechFinal', $("#grupFechFinal").val());
          params.append('grupDocAdicional', $("#grupDocAdicional").val());
  
          let result = await axios.post(`http://aplicaciones.upla.edu.pe:41000/grupo`, params);
          this.Alerta('success', 'Éxito!', 'Su registro se ingreso correctamente.')
  
        } catch (error) {
          this.Alerta('error', 'Error', 'Error al registrar los datos')
        }
      },
  
    },
  
  
    mounted: async function () {
  
    }
  }
  </script>
  
  
  