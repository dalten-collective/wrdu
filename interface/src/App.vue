<template>
  <div>
    wrdu
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
      this.urbitAPI.ship = this.shipName
      this.urbitAPI.subscribe({
        app: 'wrdu',
        path: '/website',
        event: data => {
          console.log('subscription data: ', data)
          this.$store.dispatch('setMeme', data.meme)
        }
      }).then((sub) => {
        this.loading = false
        this.$store.dispatch('setSubscription', sub)
      })
    },

    closeAirlock() {
      this.$store.dispatch('unSub')
    },
  }
}

</script>
