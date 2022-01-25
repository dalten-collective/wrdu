<template>
  <div>
    wrdu
    <button class="p-2 border rounded-md" @click="closeAirlock">close airlock</button>
    <button class="p-2 border rounded-md" @click="startGame">Start game</button>
  </div>
</template>

<script>

export default {
  data() {
    return {
      loading: false,
    }
  },

  created() {
    this.startAirlock()
  },
  unmounted() {
    this.closeAirlock()
  },

  methods: {
    startAirlock() {
      this.$store.dispatch('startAirlock')
    },

    closeAirlock() {
      this.$store.dispatch('closeAirlock')
    },

    startGame() {
      this.$store.dispatch('startGame')
    }
  }
}

</script>
