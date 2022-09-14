
<template>
  <content-header title="Panel Administrativo" />
  <content>
    <div class="container-fluid">

      <div class="row">
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-white shadow">
            <!-- <div class="overlay">
              <i class="fas fa-3x fa-sync-alt"></i>
            </div> -->
            <div class="inner">
              <p>Grupos Formados</p>
              <h3>{{ TotalGrupos }}</h3>
              
            </div>
            <div class="icon">
              <i class="ion ion-person-stalker"></i>
            </div>
            <button v-on:click="VerGrupos()" class="btn btn-block btn-sm btn-info text-right">Más información <i class="fas fa-arrow-circle-right"></i></button>
          </div>
        </div>

        <!-- ./col -->
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-gradient-white shadow">
            <div class="inner">
              <p>Grupos Avance</p>
              <!-- <h3>2<sup style="font-size: 20px">%</sup></h3>               -->
              <h3>2</h3>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
            <button v-on:click="VerGrupos()" class="btn btn-block btn-sm btn-success text-right">Más información <i class="fas fa-arrow-circle-right"></i></button>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-gradient-white shadow">
            <div class="inner">
              <p>Grupos Finalizados</p>
              <h3>4</h3>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
            <button v-on:click="VerGrupos()" class="btn btn-block btn-sm btn-warning text-right">Más información <i class="fas fa-arrow-circle-right"></i></button>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-gradient-white shadow">
            <div class="inner">
              <p>Grupos Observados</p>
              <h3>1</h3>
            </div>
            <div class="icon">
                <i class="ion ion-pie-graph"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
            <button v-on:click="VerGrupos()" class="btn btn-block btn-sm btn-danger text-right">Más información <i class="fas fa-arrow-circle-right"></i></button>
          </div>
        </div>
        <!-- ./col -->
      </div>
    </div>
  </content>
</template>



<script>
import axios from 'axios';

export default {
  name: "Total",
    data(){
      return{
        TotalGrupos: null,
      }
    },
    methods: {
        VerGrupos() {
            this.$router.push('/grupos');
        },
        async CantidadGrupo(){
           try {
                let response = await axios.get(`https://apirest.upla.edu.pe/proyeccion/grupo`);
                this.TotalGrupos = response.data.total;
            } catch (error) {
                this.error = true;
                this.error_msg = error.response.data.results;
            }
        }

    },
    mounted: function () {
      this.CantidadGrupo();
    }
}
</script>
