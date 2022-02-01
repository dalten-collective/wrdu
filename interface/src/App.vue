<template>
  <div class="max-w-md px-2 m-auto">
    <div v-if="false" class="text-red-600">
      DEBUG
      <button class="p-2 border rounded-md" @click="closeAirlock">close airlock</button>
      <button class="p-2 border rounded-md" @click="startGame">Start game</button>
    </div>
    <Hed />
    <Mesg /> <!-- needs to float -->
    <Board />
    <Guesser />
  </div>
</template>

<script>

import Board from './components/Board.vue'
import Hed from './components/Head.vue'
import Guesser from './components/Guesser.vue'
import Mesg from './components/Mesg.vue'

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

  },

  components: {
    Board,
    Hed,
    Guesser,
    Mesg
  }
}

</script>
