<template>
<div class="root">
    <h2>Create an Account</h2>
    <p>
      <input type="text" placeholder="nombre" v-model.trim="state.nombreG" />
      <span v-if="v$.nombreG.$error">
        El nombre es requerido
      </span>
    </p>
    <p>
      <input type="password" placeholder="Password" v-model="state.password" />
    </p>
    <span v-if="v$.password.$error">
      {{ v$.password.$errors[0].$message }}
    </span>
    <button @click="submitForm">Submit</button>
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
      password: '',
    })

    const rules = computed(() => {
      return {
        nombreG:
          { required },
        password:
          { required, minLength: minLength(6) }
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
        console.log(this.v$.$error)
      }
    },
  },
}

</script>