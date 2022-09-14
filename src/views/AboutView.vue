<template>
  <div id="app" class="container">
    <h1 class="text-center">Datatable with Vue</h1>

    <table id="myTable" class="table table-striped shadow mt-5">
      <thead>
        <tr class="bg-info">
          <th scope="col">Nº</th>
          <th scope="col">Apellido Paterno</th>
          <th scope="col">Apellido Materno</th>
          <th scope="col">Nombres</th>
          <th scope="col">Email</th>
          <th scope="col">Dirección</th>
          <th scope="col">Celular</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
import $ from "jquery";


export default {
  methods: {
   async getUsers() {
    try {
      let response = await axios.get('https://apirest.upla.edu.pe/Persona');
      var table = $("#myTable").DataTable({
        dom: "Bfrtip",
        buttons: ["copy", "excel", "print", "pdf", "csv"],
        data: response.data.results,
        columns: [
          { data: "docNumId" },
          { data: "persPaterno" },
          { data: "persMaterno" },
          { data: "persNombre" },
          { data: "persEmail" },
          { data: "persDireccion" },
          { data: "persCelular" },
        ],
        "language": {

          "sProcessing": "Procesando...",
          "sLengthMenu": "Mostrar _MENU_ registros",
          "sZeroRecords": "No se encontraron resultados",
          "sEmptyTable": "Ningún dato disponible en esta tabla",
          "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
          "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0",
          "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix": "",
          "sSearch": "Buscar:",
          "sUrl": "",
          "sInfoThousands": ",",
          "sLoadingRecords": "Cargando...",
          "oPaginate": {
            "sFirst": "Primero",
            "sLast": "Último",
            "sNext": "Siguiente",
            "sPrevious": "Anterior"
          },
          "oAria": {
            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }

        },
      });
     table .clear()
     .draw();
    } catch (error) {
      console.log(error);
    }

    },
  },
  mounted: async function () {

    this.getUsers();
    
  } 

}
</script>

<style>
</style>
