<template>
  <div class="max-w-md m-auto">
    <div class="text-red-600">
      DEBUG
      <button class="p-2 border rounded-md" @click="closeAirlock">close airlock</button>
      <button class="p-2 border rounded-md" @click="startGame">Start game</button>
    </div>

    <Board />
    <Guesser />
  </div>
</template>

<script>

import Board from './components/Board.vue'
import Guesser from './components/Guesser.vue'

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
      this.$store.dispatch('ship/startAirlock')
    },

    closeAirlock() {
      this.$store.dispatch('ship/closeAirlock')
    },

    startGame() {
      this.$store.dispatch('game/startGame')
      // or: import gameApi and call startGame directly
    }
  },

  components: {
    Board,
    Guesser
  }
}

</script>
