<template>
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
            <a class="nav-link" id="custom-tabs-three-messages-tab" data-toggle="pill" href="#integrantes" role="tab"
              aria-controls="integrantes" aria-selected="false">
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
              <div class="col-sm-12">
                <div class="form group mt-2">
                  <label>Número de Grupo :</label>
                  <input type="text" id="grupoNumero" class="form-control" >
                </div>
              </div>

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
                  <input type="text" id="grupAsesor" class="form-control">
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-12">
                <div class="form group mt-2">
                  <label>Linea de proyeccion :</label>
                  <input type="text" id="grupLinProyecto" class="form-control"  v-model.trim="state.lineaP">
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
                    <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check1"
                      checked="">
                    <label for="check1" class="custom-control-label">Solicitud dirigida al decano de la facultad</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check2"
                      checked="">
                    <label for="check2" class="custom-control-label">Constancia de Aceptación del asesor</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check3"
                      checked="">
                    <label for="check3" class="custom-control-label">Constancia de Compromiso del estudiante</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check4"
                      checked="">
                    <label for="check4" class="custom-control-label">Constancia de Matricula del estudiante</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input custom-control-input-danger" type="checkbox" id="check5"
                      checked="">
                    <label for="check5" class="custom-control-label">Documento de aceptación</label>
                  </div>
                </div>
              </div>
            </div>

            <div class="mt-4 mb-2">
                <button type="button" class="btn btn-success btn-sm btn-block" @click="submitForm">Guardar</button>
            </div>
          </div>

          </div>
          <div class="tab-pane fade" id="integrantes" role="tabpanel" aria-labelledby="integrantes-tab">
            <div class="row">

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
              <button type="button" v-on:click="Anexar()" class="btn btn-success btn-sm btn-block">Registrar estudiantes
                al Grupo</button>
            </div>

          </div>
        </div>
      </div>
    </div>

  </div>

</template>

<script>
import useValidate from '@vuelidate/core'
import { required, minLength, sameAs, helpers } from '@vuelidate/validators'
import { reactive, computed } from 'vue'

export default {
  setup() {
    const state = reactive({
      nombreG: '',
      tituloT: '',
      lineaP: '',
      fechaI: '',
      fechaF: '',
      // password: '',
    })

    const rules = computed(() => {
      return {
        nombreG: { required },
        tituloT: { required },
        lineaP: { required },
        fechaI: { required },
        fechaF: { required },
        // password:
        //   { required, minLength: minLength(6) }
      }
    })

    const v$ = useValidate(rules, state)

    return {
      state,
      v$,
    }
  },

  methods: {
    submitForm() {
      this.v$.$validate() // checks all inputs
      if (!this.v$.$error) {
        alert('Formulario entregado satisfactoriamente.')
      }
      else {
        alert('Validación fallida del formulario')
        console.log(this.v$)
      }
    },
  },
}

</script>
