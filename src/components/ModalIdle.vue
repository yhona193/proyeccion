<template>

  <div class="overlay">
    <div class="card bg-gradient-danger caja justify-content-center">
        <div class="card-header">
          <span>Sesión expirada</span>
        </div>
        <div class="p-3">
          <p>Ha dejado este navegador inactivo durante 3 minutos.</p>
          <p>{{ time / 1000 }} segundo</p>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      time: 10000,
    };
  },
  created() {
    let timerId = setInterval(() => {
      this.time -= 2000;
      if (!this.$store.state.idleVue.isIdle) clearInterval(timerId);

      if (this.time < 1) {
        clearInterval(timerId);
        // Your logout function should be over here
        // alert("logout user....");
        this.$router.push('/lockscreen');
      }
    }, 1000);
  },
};
</script>

<style lang="postcss" scoped>
.overlay {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 100;
  display: flex;
  align-items: center;
  justify-content: center;
}

.caja {
  width: 500px;
  box-shadow: 1px 2px 4px rgba(153, 155, 168, 0.12);
  border-radius: 4px;
  @apply bg-white p-2;
}

.modal__title {
  color: #38404f;
  @apply flex items-center justify-between p-3 font-bold;
}
</style>