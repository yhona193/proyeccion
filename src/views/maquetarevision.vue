<template>
  <content-header title="Docentes" />
  <content>
    <div class="container-fluid">
    <div class="row">

      <!--=====================================
      EL FORMULARIO
      ======================================-->
      
      <div class="col-lg-6 col-xs-12">
        
        <div class="box box-success">
          
          <div class="box-header with-border"></div>

          <form role="form" method="post" class="formularioVenta">

            <div class="box-body">
  
              <div class="box">

                <!--=====================================
                ENTRADA DEL VENDEDOR
                ======================================-->
            
                <div class="form-group">
                
                  <div class="input-group">
                    
                    <span class="input-group-addon"><i class="fa fa-user"></i></span> 

                    <input type="text" class="form-control" id="nuevoVendedor" value="" readonly>

                    <input type="hidden" name="idVendedor" value="">

                  </div>

                </div> 

                <!--=====================================
                ENTRADA DEL CÓDIGO
                ======================================--> 

                <div class="form-group">
                  
                  <div class="input-group">
                    
                    <span class="input-group-addon"><i class="fa fa-key"></i></span>


                      <input type="text" class="form-control" id="nuevaVenta" name="nuevaVenta" value="10001" readonly>;




                      <input type="text" class="form-control" id="nuevaVenta" name="nuevaVenta" value="'.$codigo.'" readonly>;
                
                    
                    
                  </div>
                
                </div>

                <!--=====================================
                ENTRADA DEL CLIENTE
                ======================================--> 

                <div class="form-group">
                  
                  <div class="input-group">
                    
                    <span class="input-group-addon"><i class="fa fa-users"></i></span>
                    
                    <select class="form-control" id="seleccionarCliente" name="seleccionarCliente" required>

                    <option value="">Seleccionar cliente</option>

                    </select>
                    
                    <span class="input-group-addon"><button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalAgregarCliente" data-dismiss="modal">Agregar cliente</button></span>
                  
                  </div>
                
                </div>

                <!--=====================================
                ENTRADA PARA AGREGAR PRODUCTO
                ======================================--> 

                <div class="form-group row nuevoProducto">

                

                </div>

                <input type="hidden" id="listaProductos" name="listaProductos">

                <!--=====================================
                BOTÓN PARA AGREGAR PRODUCTO
                ======================================-->

                <button type="button" class="btn btn-default hidden-lg btnAgregarProducto">Agregar producto</button>

                <hr>

                <div class="row">

                  <!--=====================================
                  ENTRADA IMPUESTOS Y TOTAL
                  ======================================-->
                  
                  <div class="col-xs-8 pull-right">
                    
                    <table class="table">

                      <thead>

                        <tr>
                          <th>Impuesto</th>
                          <th>Total</th>      
                        </tr>

                      </thead>

                      <tbody>
                      
                        <tr>
                          
                          <td style="width: 50%">
                            
                            <div class="input-group">
                           
                              <input type="number" class="form-control input-lg" min="0" id="nuevoImpuestoVenta" name="nuevoImpuestoVenta" placeholder="0" required>

                               <input type="hidden" name="nuevoPrecioImpuesto" id="nuevoPrecioImpuesto" required>

                               <input type="hidden" name="nuevoPrecioNeto" id="nuevoPrecioNeto" required>

                              <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                        
                            </div>

                          </td>

                           <td style="width: 50%">
                            
                            <div class="input-group">
                           
                              <span class="input-group-addon"><i class="ion ion-social-usd"></i></span>

                              <input type="text" class="form-control input-lg" id="nuevoTotalVenta" name="nuevoTotalVenta" total="" placeholder="00000" readonly required>

                              <input type="hidden" name="totalVenta" id="totalVenta">
                              
                        
                            </div>

                          </td>

                        </tr>

                      </tbody>

                    </table>

                  </div>

                </div>

                <hr>

                <!--=====================================
                ENTRADA MÉTODO DE PAGO
                ======================================-->

                <div class="form-group row">
                  
                  <div class="col-xs-6" style="padding-right:0px">
                    
                     <div class="input-group">
                  
                      <select class="form-control" id="nuevoMetodoPago" name="nuevoMetodoPago" required>
                        <option value="">Seleccione método de pago</option>
                        <option value="Efectivo">Efectivo</option>
                        <option value="TC">Tarjeta Crédito</option>
                        <option value="TD">Tarjeta Débito</option>                  
                      </select>    

                    </div>

                  </div>

                  <div class="cajasMetodoPago"></div>

                  <input type="hidden" id="listaMetodoPago" name="listaMetodoPago">

                </div>

                <br>
      
              </div>

          </div>

          <div class="box-footer">

            <button type="submit" class="btn btn-primary pull-right">Guardar venta</button>

          </div>

        </form>


        </div>
            
      </div>

      <!--=====================================
      LA TABLA DE PRODUCTOS
      ======================================-->

      <div class="col-lg-6 hidden-md hidden-sm hidden-xs">
        
        <div class="box box-warning">

          <div class="box-header with-border"></div>

          <div class="box-body">
            
            <table class="table table-bordered table-striped dt-responsive tablaVentas">
              
               <thead>

                 <tr>
                  <th style="width: 10px">#</th>
                  <th>Imagen</th>
                  <th>Código</th>
                  <th>Descripcion</th>
                  <th>Stock</th>
                  <th>Acciones</th>
                </tr>

              </thead>

            </table>

          </div>

        </div>


      </div>

    </div>
    </div>

  </content>




</template>

<script>
import axios from 'axios';

export default {
  name: "grupos",
  data() {
    return {
      ListarAlumnos: null,

    }
  },
  methods: {
    async Mostrar(codigo) {
      try {
        let response = await axios.get(`http://aplicaciones.upla.edu.pe:45000/est_estudiante?linkTo=Est_Id&search=${codigo}`);
        this.ListarAlumnos = response.data.results;
        console.log(response.data.results[0])
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
        this.Alerta('Exito', 'El registro ha sido editado satisfactoriamente', 'bg-success')

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
    AgregarGrupo(id){
      alert(id)
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
    async Buscar() {

      let codigo = $("#inputPassword2").val();
      this.Mostrar(codigo);

    }



  },


  mounted: async function () {
    // this.Mostrar();
  }
}
</script>


