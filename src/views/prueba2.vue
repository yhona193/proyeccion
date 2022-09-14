<template>
    <div id="app-6">
        <p>{{ message }}</p>
        <input v-model="message">
    </div>
    <form method="post" class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <input type="text" class="form-control" id="inputPassword2" placeholder="Código de Estudiante">
        </div>
        <button type="button" class="btn btn-info mb-2" v-on:click="Agregar()"><i class="fas fa-plus"></i>
            Agregar</button>
    </form>
    <ol id="app">
        <li v-for="todo in todos">
            {{ todo.text }}
        </li>
    </ol>
    <div v-for="(field, i) in inputs">
        <input v-model="field.result" type="text">
        <button v-on:click="eliminar(i)">Eliminar</button>
    </div>

    <button v-on:click="agregar()">Agregar</button>
</template>

<script>
export default {
    data() {
        return {
            message: '',
            inputs: [],
            todos: [{ text: 'Hola Vue!' },
            { text: 'Chau vue' }
            ]
        }

    },
    methods: {
        eliminar(i) {
            this.inputs.splice(i, 1);
        },
        Agregar() {
            let codigo = $("#inputPassword2").val();
            this.inputs.push({ result: codigo })
        }
    }
}
</script>



  <!-- $sidebar.append($container)

  // Checkboxes

  $container.append(
    '<h5>Customize AdminLTE</h5><hr class="mb-2"/>'
  )

  var $dark_mode_checkbox = $('<input />', {
    type: 'checkbox',
    value: 1,
    checked: $('body').hasClass('dark-mode'),
    class: 'mr-1'
  }).on('click', function () {
    if ($(this).is(':checked')) {
      $('body').addClass('dark-mode')
    } else {
      $('body').removeClass('dark-mode')
    }
  })
  var $dark_mode_container = $('<div />', { class: 'mb-4' }).append($dark_mode_checkbox).append('<span>Dark Mode</span>')
  $container.append($dark_mode_container) -->