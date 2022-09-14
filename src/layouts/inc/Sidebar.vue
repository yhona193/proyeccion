<template>
  <aside class="main-sidebar sidebar-dark-white">
    <!-- Brand Logo -->
    <a class="brand-link">
      <img src="@/views/assets/img/template/LogoUpla5.png" class="brand-image img-circle elevation-2">
      <span class="brand-text font-weight-white">Proyección Social</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="row">
        <div class="card-body box-profile">
          <div class="text-center">
            <img class="profile-user-img img-fluid img-circle"
              src="@/views/assets/img/template/docentes/default/default.png" alt="User profile picture">
          </div>
        </div>
      </div>

      <div id="datosUsuario" class="user-panel text-center">
        <div class="info">
          <a class="d-block text-center">{{ this.Nombres }}</a>
          <!-- <a class="d-block text-center">{{ this.ApellidoP }} {{ this.ApellidoM }}</a> -->
          <a class="d-block text-center">Código: {{ this.Codigo }}</a>
          <a class="d-block text-center text-uppercase text-yellow">{{ this.Rol }}</a>
        </div>
      </div>
      <div>
      </div>

      <!-- SidebarSearch Form -->
      <!-- <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

          <nav-item icon="fas fa-home" link="/inicio">
            Inicio
          </nav-item>
          <nav-item icon="fas fa-user" link="/estudiantes">
            Estudiantes
          </nav-item>
          <nav-item icon="fas fa-users" link="/grupos">
            Grupos
          </nav-item>
          <!-- <nav-item icon="fas fa-file" link="/revision">
            Revision de proyectos
          </nav-item> -->
          <!-- <nav-item icon="fas fa-info-circle" link="/about">
            About
          </nav-item> -->
          <!-- <nav-item icon="fas fa-users" link="/docentes">
            Docentes
          </nav-item> -->

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
</template>

<script>
import NavItem from "./NavItem.vue"

export default {
  data() {
    return {
      Codigo: sessionStorage.getItem('codigo'),
      ApellidoP: sessionStorage.getItem('ApellidoP'),
      ApellidoM: sessionStorage.getItem('ApellidoM'),
      Nombres: sessionStorage.getItem('Nombres'),
      Rol: sessionStorage.getItem('Rol'),

    }
  },
  components: {
    NavItem
  }
}
</script>