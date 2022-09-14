<template>
    <content-header title="Editar Grupos" />
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
                                    <button type="button" class="btn btn-info mb-2" v-on:click="Buscar()"><i
                                            class="fas fa-search"></i>
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
                                            <td><button type="button"
                                                    class="btn btn-success btn-sm mr-1 rounded-circle agregarEstudiante"
                                                    v-on:click="AgregarGrupo(alumnos.Est_Id)"
                                                    :disabled="form_submitting"><i class='fas fa-plus'></i></button>
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
                    <div class="card card-info card-outline card-tabs">
                        <div class="card-header p-0 pt-1 border-bottom-0">
                            <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="custom-tabs-three-profile-tab" data-toggle="pill"
                                        href="#datosGrupo" role="tab" aria-controls="datosGrupo" aria-selected="true">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">Datos del Grupo</font>
                                        </font>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-three-messages-tab" data-toggle="pill"
                                        href="#integrantes" role="tab" aria-controls="integrantes"
                                        aria-selected="false">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">Integrantes</font>
                                        </font>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="card-body">
                            <div class="tab-content" id="custom-tabs-three-tabContent">
                                <div class="tab-pane fade active show" id="datosGrupo" role="tabpanel"
                                    aria-labelledby="datosGrupo-tab">
                                    <div class="root">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form group mt-2">
                                                    <label>Título de Trabajo :</label>
                                                    <input type="text" id="grupTituProyecto" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form group mt-2">
                                                    <label>Nombre de grupo :</label>
                                                    <input type="text" id="grupNombre" class="form-control">
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
                                                    <input type="text" id="grupLinProyecto" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form group mt-2">
                                                    <label>Fecha de Inicio :</label>
                                                    <input type="date" id="grupFechInicio" class="form-control">
                                                </div>
                                            </div>


                                            <div class="col-sm-6">
                                                <div class="form group mt-2">
                                                    <label>Fecha de Finalización :</label>
                                                    <input type="date" id="grupFechFinal" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form group mt-4">
                                                    <label>Documentos Adicionales :</label>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input custom-control-input-danger"
                                                            type="checkbox" id="check1" value="1"
                                                            v-model="checkedNames">
                                                        <label for="check1" class="custom-control-label">Solicitud
                                                            dirigida al decano de la
                                                            facultad</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input custom-control-input-danger"
                                                            type="checkbox" id="check2" value="2"
                                                            v-model="checkedNames">
                                                        <label for="check2" class="custom-control-label">Constancia de
                                                            Aceptación del asesor</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input custom-control-input-danger"
                                                            type="checkbox" id="check3" value="3"
                                                            v-model="checkedNames">
                                                        <label for="check3" class="custom-control-label">Constancia de
                                                            Compromiso del
                                                            estudiante</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <input class="custom-control-input custom-control-input-danger"
                                                            type="checkbox" id="check4" value="4"
                                                            v-model="checkedNames">
                                                        <label for="check4" class="custom-control-label">Documento de
                                                            aceptación</label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="mt-4 mb-2">
                                            <button type="button" class="btn btn-success btn-sm btn-block"
                                                @click="Guardar()">Guardar Cambios</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="integrantes" role="tabpanel"
                                    aria-labelledby="integrantes-tab">
                                    <div class="row">
                                        <div class="col-sm-12 mt-2 mb-4">
                                            <label>Integrantes :</label>
                                            <div class="table-responsive">
                                                <table id="TablaGruposFormados" class="table table-hover">
                                                    <thead>
                                                        <tr class="bg-info">
                                                            <th>Código</th>
                                                            <th>Dni</th>
                                                            <th>Nombre</th>
                                                            <th>Estado</th>
                                                            <th>Observación</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="grupo in personas" :key="grupo.detGruId">
                                                            <td>{{ grupo.persCodigo}}</td>
                                                            <td>{{ grupo.docNumId}}</td>
                                                            <td>{{ grupo.persNombre}}</td>
                                                            <td>
                                                                <div v-if="grupo.detGruEst > 0">
                                                                    <button
                                                                        class="btn  btn-sm btn-success">Activo</button>
                                                                </div>
                                                                <div v-else>
                                                                    <button
                                                                        class="btn  btn-sm btn-danger">Observado</button>
                                                                </div>
                                                            </td>
                                                            <td>{{ grupo.detGruObs}}</td>
                                                            <td><button type="button"
                                                                    class="btn btn-warning btn-sm mr-1 rounded-circle"
                                                                    v-on:click="EditarEst(grupo.detGruId)"><i
                                                                        class='fas fa-pencil-alt'></i></button>
                                                                <button type="button"
                                                                    class="btn btn-danger btn-sm mr-1 rounded-circle"
                                                                    v-on:click="EliminarEst(grupo.detGruId)"><i
                                                                        class='fas fa-trash'></i></button>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </content>

    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Observaciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <div class="form group mt-2">
                          <input type="hidden" id="Observacion" class="form-control">
                        </div>
                      </div>
                    <div class="col-md-12">
                        <div class="form-group mt-2">
                            <label>Estado:</label>
                            <select id="Estado" class="form-control">
                                <option value="1">Activo</option>
                                <option value="0">Desactivado</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Observación</label>
                        <textarea class="form-control" id="textObservacion" rows="3" placeholder="Escribe aqui ..."></textarea>
                      </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" @click="guardarObservacion()" class="btn btn-primary">Guardar cambios</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            ListarAlumnos: null,
            personas: null,
        }
    },
    methods: {
        EliminarEst(id){
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
                    let url =  `http://apiproyeccion.com/detallegrupo?id=${id}&nameId=detGruId`;
                   
                if (result.isConfirmed) {
                    axios.delete(url).then(response =>{
                        console.log(response.data.results);
                        this.estudiantesGrupo();
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
            
        },
        async guardarObservacion(){
            try{
                this.codId = $("#Observacion").val();

                const params = new URLSearchParams();

                // params.append('detGruId', $("#grupNombre").val());Estado
                params.append('detGruObs', $("#textObservacion").val());
                params.append('detGruEst', $("#Estado").val());
                
                let result = await axios.put(`http://apiproyeccion.com/detallegrupo?id=${this.codId}&nameId=detGruId`, params);
                console.log(result);
                this.Alerta('success', 'Éxito!', 'Su observaciones se registraron correctamente.')
                $('#exampleModalCenter').modal('hide');
                this.estudiantesGrupo();

            }catch(error){
                console.log(error)
            }
        },
        EditarEst(id) {
            $('#exampleModalCenter').modal('show')
            $('#Observacion').val(id)
        },
        Buscar() {
            let codigo = $("#inputBusqueda").val();
            this.Mostrar(codigo);
        },
        async estudiantesGrupo() {
            try {
                this.grupoId = this.$route.params.id;
                let response = await axios.get(`http://apiproyeccion.com/detallegrupo?linkTo=grupId&equalTo=${this.grupoId}`)
                this.personas = response.data.results;
                console.log(this.personas)
                // for (let index = 0; index < this.personas.length; index++) {
                //     console.log(this.personas[index].persNombre)
                // }   
            } catch (error) {
                console.log(error)
            }
        },
        async Mostrar(codigo) {
            try {
                let response = await axios.get(`http://aplicaciones.upla.edu.pe:45000/est_estudiante?linkTo=Est_Id&search=${codigo}`);
                this.ListarAlumnos = response.data.results;
            } catch (error) {
                this.error = true;
                this.error_msg = error.response.data.results;
            }
        },
        async Obtener() {
            this.codigo = this.$route.params.id;
            let response = await axios.get(`http://apiproyeccion.com/grupo?linkTo=grupId&search=${this.codigo}`)
            let data = response.data.results[0];
            $("#grupTituProyecto").val(data.grupTituProyecto);
            $("#grupNombre").val(data.grupNombre);
            $("#grupAsesor").val(data.grupAsesor);
            $("#grupLinProyecto").val(data.grupLinProyecto);
            $("#grupFechInicio").val(data.grupFechInicio);
            $("#grupFechFinal").val(data.grupFechFinal);
            let str = data.grupDocAdicional;
            let arreglo = str.split(',');
            // console.log(arreglo);
            // console.log(arreglo[0]);

            for (let index = 0; index < arreglo.length; index++) {

                console.log(arreglo[index])
                if (arreglo[index] == 1) {
                    $('#check1').prop("checked", true);
                }
                if (arreglo[index] == 2) {
                    $('#check2').prop("checked", true);
                }
                if (arreglo[index] == 3) {
                    $('#check3').prop("checked", true);
                }
                if (arreglo[index] == 4) {
                    $('#check4').prop("checked", true);
                }

            }
            this.estudiantesGrupo()


        },
        Alerta(icono, titulo, descripcion) {
            this.$swal.fire({
                icon: icono,
                title: titulo,
                text: descripcion,
            })
        },
        Alerta2(){
            this.$swal.fire({
            title: '¿Estas seguro de eliminar el registro?',
            text: "No podrás revertir esto",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, eliminarlo!'
            }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                'Cancelar',
                'Su archivo ha sido eliminado.',
                'success'
                )
            }
            })
        },
        async Guardar() {
            try {
                const params = new URLSearchParams();

                var id = this.$route.params.id;

                params.append('grupTituProyecto', $("#grupTituProyecto").val());
                params.append('grupNombre', $("#grupNombre").val());
                params.append('grupModalidad', $("#grupModalidad").val());
                params.append('grupAsesor', $("#grupAsesor").val());
                params.append('grupLinProyecto', $("#grupLinProyecto").val());
                params.append('grupFechInicio', $("#grupFechInicio").val());
                params.append('grupFechFinal', $("#grupFechFinal").val());

                // var cadena = JSON.stringify(this.checkedNames)

                // cadena = cadena.replace(/['"]+/g, '');
                // cadena = cadena.replace(/[\[\]]/g, "");

                // params.append('grupDocAdicional', cadena)
                // params.append('grupEst', '1');

                let result = await axios.put(`http://apiproyeccion.com/grupo?id=${id}&nameId=grupId`, params);
                console.log(result);
                this.Alerta('success', 'Éxito!', 'Su registro fue editado correctamente.')

            } catch (error) {
                this.Alerta('error', 'Error', 'Error al editar los datos')
                console.log(error)
            }

        }
    },
    mounted() {
        this.Obtener();
    }
}
</script>