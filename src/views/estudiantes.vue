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
                      <td scope="row">{{ alumnos.Est_Id }}</td>
                      <td>{{ alumnos.Est_Paterno }}</td>
                      <td>{{ alumnos.Est_Materno }}</td>
                      <td>{{ alumnos.Est_Nombre }}</td>
                      <td><button type="button" class="btn btn-success btn-sm mr-1 rounded-circle agregarEstudiante"
                          v-on:click="AgregarGrupo(alumnos.Est_Id)" :disabled="form_submitting"><i
                            class='fas fa-plus'></i></button>
                      </td>
                      <!-- <td><button type="button" class="btn btn-warning btn-sm mr-1 rounded-circle agregarEstudiante"
                          v-on:click="AgregarEstudent(alumnos.Est_Id)" :disabled="form_submitting"><i
                            class='fas fa-plus'></i></button>
                      </td> -->
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
          <div class="card card-info card-outline card-tabs">
            <div class="card-header p-0 pt-1 border-bottom-0">
              <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="custom-tabs-three-profile-tab" data-toggle="pill" href="#datosGrupo"
                    role="tab" aria-controls="datosGrupo" aria-selected="true">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">Datos del Grupo</font>
                    </font>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="custom-tabs-three-messages-tab" data-toggle="pill" href="#integrantes"
                    role="tab" aria-controls="integrantes" aria-selected="false">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">Integrantes</font>
                    </font>
                  </a>
                </li>
              </ul>
            </div>
            <div class="card-body">
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade active show" id="datosGrupo" role="tabpanel" aria-labelledby="datosGrupo-tab">
                  <div class="root">
                    <div class="row">
                      <!-- <div class="col-sm-12">
                      <div class="form group mt-2">
                        <label>Número de Grupo :</label>
                        <input type="text" id="grupoNumero" class="form-control" >
                      </div>
                    </div> -->

                      <div class="col-sm-12">
                        <div class="form group mt-2">
                          <label>Título de Trabajo :</label>
                          <input type="text" id="grupTituProyecto" class="form-control" v-model.trim="state.tituloT">
                          <span class="text-danger" v-if="v$.tituloT.$error">
                            El título del trabajo es necesario
                          </span>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form group mt-2">
                          <label>Nombre de grupo :</label>
                          <input type="text" id="grupNombre" class="form-control" v-model.trim="state.nombreG">
                          <span class="text-danger" v-if="v$.nombreG.$error">
                            El nombre del grupo es necesario
                          </span>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form group mt-2">
                          <label>Asesor o Asesores :</label>
                          <input type="text" id="grupAsesor" class="form-control" v-model.trim="state.Ase">
                          <span class="text-danger" v-if="v$.Ase.$error">
                            El asesor es necesario
                          </span>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form group mt-2">
                          <label>Linea de proyeccion :</label>
                          <input type="text" id="grupLinProyecto" class="form-control" v-model.trim="state.lineaP">
                          <span class="text-danger" v-if="v$.lineaP.$error">
                            La linea de investigación es necesario
                          </span>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form group mt-2">
                          <label>Fecha de Inicio :</label>
                          <input type="date" id="grupFechInicio" class="form-control" v-model.trim="state.fechaI">
                          <span class="text-danger" v-if="v$.fechaI.$error">
                            La fecha de inicio es necesario
                          </span>
                        </div>
                      </div>


                      <div class="col-sm-6">
                        <div class="form group mt-2">
                          <label>Fecha de Finalización :</label>
                          <input type="date" id="grupFechFinal" class="form-control" v-model.trim="state.fechaF">
                          <span class="text-danger" v-if="v$.fechaI.$error">
                            La fecha final es necesario
                          </span>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form group mt-4">
                          <label>Documentos Adicionales :</label>
                          <div class="custom-control custom-checkbox">
                            <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check1" value="1" v-model="checkedNames">
                            <label for="check1" class="custom-control-label">Solicitud dirigida al decano de la
                              facultad</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check2" value="2" v-model="checkedNames">
                            <label for="check2" class="custom-control-label">Constancia de Aceptación del asesor</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check3" value="3" v-model="checkedNames">
                            <label for="check3" class="custom-control-label">Constancia de Compromiso del
                              estudiante</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check4" value="4" v-model="checkedNames">
                            <label for="check4" class="custom-control-label">Documento de aceptación</label>
                          </div>
                          
                        </div>
                      </div>
                    </div> 

                    <div class="mt-4 mb-2">
                      <button type="button" class="btn btn-success btn-sm btn-block"
                        @click="GuardarFormulario">Guardar</button>
                    </div>
                  </div>

                </div>
                <div class="tab-pane fade" id="integrantes" role="tabpanel" aria-labelledby="integrantes-tab">
                  <div class="row">

                    <div class="col-sm-12 mt-4 mb-4">
                      <label>Integrantes :</label>
                      <div v-for="(persona, indice) in personas">
                        <!-- <div v-for="persona in 5" :key="persona">
                          
                          {{ persona }} . {{ personas[persona] }}  -->

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
                      <br>
                      <label>Total :</label>
                      {{ personas.length }}
                      <div>

                      </div>

                    </div>
                  </div>

                  <div v-if=" personas.length > 5">
                    <div class="mt-2 mb-2">
                    <button type="button" v-on:click="Anexar()" class="btn btn-success btn-sm btn-block">Registrar
                      estudiantes
                      al Grupo</button>
                  </div>
                  </div>
                  <div v-else>
                  </div>



                </div>
              </div>
            </div>
          </div>

        </div>


      </div>
    </div>
  </content>
</template>


<script>
import axios from 'axios';
import useValidate from '@vuelidate/core'
import { required, email, minLength, sameAs, helpers } from '@vuelidate/validators'
import { reactive, computed } from 'vue'

export default {
  name: "grupos",
  data() {
    return {
      contador: 0,
      ListarAlumnos: null,
      form_submitting: false,
      inputs: [],
      errors: [],
      titulo: null,
      personas: [],
      checkedNames: []
    }
  },
  setup() {
    const state = reactive({
      nombreG: '',
      tituloT: '',
      lineaP: '',
      Ase: '',
      fechaI: '',
      fechaF: '',
      // password: '',
    })

    const rules = computed(() => {
      return {
        nombreG: { required },
        tituloT: { required },
        lineaP: { required },
        Ase: { required },
        fechaI: { required },
        fechaF: { required },
        //   password:
        //     { required, minLength: minLength(6) }
      }
    })

    const v$ = useValidate(rules, state)

    return {
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

    repetir() {
      for (let index = 0; index < this.personas.length; index++) {
        if (this.datosEstudiantes.Est_Id == this.personas[index].estId) {
          alert('valor repetido')
        }
      }

    },
    agre() {
      this.personas.push({
        estId: this.datosEstudiantes.Est_Id,
        estDni: this.datosEstudiantes.Est_NumDoc,
        estNombre: this.datosEstudiantes.Est_Nombre + " " + this.datosEstudiantes.Est_Paterno + " " + this.datosEstudiantes.Est_Materno
      })
    },

    nosepuede() {
      this.Alerta('error', 'Error', 'No se pueden ingresar al estudiante 2 veces')
    },

    AgregarEstudent(id) {

      var $num = document.getElementById('tablaEstudiantes').getElementsByTagName('tr');
      console.log($num);

      // let ObtenerDato = document.getElementsByTagName("td")

      // console.log(ObtenerDato[0].innerHTML)
      // console.log(ObtenerDato[1].innerHTML)
      // console.log(ObtenerDato[2].innerHTML)
      // console.log(ObtenerDato[3].innerHTML)

    },

    async AgregarGrupo(id) {

      if (this.personas.length < 8) {
        let response = await axios.get(`http://aplicaciones.upla.edu.pe:45000/est_estudiante?linkTo=Est_Id&search=${id}`);
        this.datosEstudiantes = response.data.results[0];

        this.personas.push({
          estId: this.datosEstudiantes.Est_Id,
          estDni: this.datosEstudiantes.Est_NumDoc,
          estNombre: this.datosEstudiantes.Est_Nombre + " " + this.datosEstudiantes.Est_Paterno + " " + this.datosEstudiantes.Est_Materno
        })

        // if(this.datosEstudiantes.Est_Id == this.personas[index].estId){


        // for (let index = 0; index < this.personas.length; index++) {
        //   console.log(this.personas);

        // }




        // for (let index = 0; index < this.personas.length; index++) {
        //   if(this.datosEstudiantes.Est_Id == this.personas[index].estId){
        //     alert('repetida')
        //   }else{
        //     this.agre();
        //   }
        // }





        // if(this.personas.length == 0){
        //  this.agre();

        // }else{
        //   for (let index = 0; index < this.personas.length; index++) {
        //   if(this.datosEstudiantes.Est_Id == this.personas[index].estId){
        //     this.Alerta('error', 'Error', 'No se pueden ingresar al estudiante 2 veces')
        //   }else{
        //     this.agre();
        //   }

        //   }
        // }



        // else{

        //     for (let index = 0; index < this.personas.length; index++) {
        //       if(this.datosEstudiantes.Est_Id == this.personas[index].estId){
        //         alert('repetida')
        //       }else{
        //         this.agre();
        //       }
        //     }


        // for(i in this.datosEstudiantes){
        //   if(this.datosEstudiantes.Est_Id == this.personas[1].estId){
        //     alert('repetida')
        //   }
        // }

        // if(this.datosEstudiantes.Est_Id == this.personas[0].estId){
        //   alert('valor repetido')
        // }else{
        //   this.agre();
        // }


        // }




        // for (let index = 0; index < this.personas.length; index++) {
        //   if(index == 0){
        //     alert('hola')
        //   }
        //   if(this.datosEstudiantes.Est_Id == this.personas[index].estId){
        //     alert('valor repetido')
        //   }else{
        //     this.agre();
        //   }
        // }



        // if((this.personas[0] == null)){
        //   this.agre();
        // }else{
        //   for (let index = 0; index < this.personas.length; index++) {
        //   if(this.datosEstudiantes.Est_Id == this.personas[index].estId){
        //     this.Alerta('error', 'Error', 'No se pueden ingresar al estudiante 2 veces')
        //   }else{
        //     this.agre();
        //   }
        //   }
        // }

      } else {
        this.Alerta('error', 'Error', 'No se pueden registrar mas de 8 estudiantes por grupo')
      }





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
          params.append('grupId', localStorage.getItem('UltimoId'));
          
          let result = await axios.post(`https://apirest.upla.edu.pe/proyeccion/integrantes`, params);
          this.Alerta('success', 'Éxito!', 'Su registro se ingreso correctamente.')

        } catch (error) {
          console.log(error);
          this.Alerta('error', 'Error', 'Error al registrar los datos')
        }
      }

      
      this.Alerta('success', 'Éxito!', 'Su registro se ingreso correctamente.')
        this.personas.splice(indice, 1);
      localStorage.clear()
    },

    Buscar() {
      let codigo = $("#inputBusqueda").val();
      this.Mostrar(codigo);
    },
    eliminarI(indice) {
      this.personas.splice(indice, 1);
    },

    restdatos() {
      $('#grupTituProyecto').val('')
      $('#grupNombre').val('')
      $('#grupModalidad').val('')
      $('#grupAsesor').val('')
      $('#grupLinProyecto').val('')
      $('#grupFechInicio').val('')
      $('#grupFechFinal').val('')
      $('#check1').prop("checked", false);
      $('#check2').prop("checked", false);
      $('#check3').prop("checked", false);
      $('#check4').prop("checked", false);

    },

    async GuardarFormulario() {
      this.v$.$validate() // checks all inputs
      if (!this.v$.$error) {
        try {
          const params = new URLSearchParams();
          // params.append('grupId', $("#grupoNumero").val());
          params.append('grupTituProyecto', $("#grupTituProyecto").val());
          params.append('grupNombre', $("#grupNombre").val());
          params.append('grupModalidad', $("#grupModalidad").val());
          params.append('grupAsesor', $("#grupAsesor").val());
          params.append('grupLinProyecto', $("#grupLinProyecto").val());
          params.append('grupFechInicio', $("#grupFechInicio").val());
          params.append('grupFechFinal', $("#grupFechFinal").val());

          var cadena = JSON.stringify(this.checkedNames)
          
          cadena = cadena.replace(/['"]+/g, '');
          cadena = cadena.replace(/[\[\]]/g, "");

          params.append('grupDocAdicional', cadena)
          

          params.append('grupEst', '1');
          // params.append('grupFechRegistro', date('Y-m-d'));

          let result = await axios.post(`https://apirest.upla.edu.pe/proyeccion/grupo`, params);
          console.log(result.data.results.lastId);
          localStorage.UltimoId = result.data.results.lastId;
          this.Alerta('success', 'Éxito!', 'Su registro se ingreso correctamente.')
          this.restdatos();
          // this.$router.push('/grupos');
          

        } catch (error) {
          this.Alerta('error', 'Error', 'Error al registrar los datos')
          console.log(error)
        }
      }
      else {
        this.Alerta('error', 'Error', 'Error al registrar los datos')
        console.log(this.v$.$error)
        
      }
    },

  },

  mounted() {

  }

}
</script>
  

