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
                            <div class="container mb-3">
                                <div class="row justify-content-center">
                                    <div class="col-9">
                                        <input  v-model="tituloGrupo" type="text" class="form-control" id="inputBusqueda" placeholder="Ingrese el nombre del grupo">
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
                                                    v-on:click="Eliminar(docentes.docNumId)"><i
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
        }
    }
}
</script>


