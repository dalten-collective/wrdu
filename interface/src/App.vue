<template>
  <div class="max-w-full">
    <div v-if="false" class="text-red-600">
      DEBUG
      <button class="p-2 border rounded-md" @click="closeAirlock">close airlock</button>
      <button class="p-2 border rounded-md" @click="startGame">Start game</button>
    </div>

    <Hed class="border-b hed-border" />

    <Mesg />

    <div v-if="noGame" class="flex flex-col justify-center min-h-screen">
       <div class="flex justify-center">
         <button class="px-4 py-2 font-bold rite rounded-md" @click="startGame">
          start 
            &#128880;
          game
         </button>
       </div>
    </div>
    <div v-else>
      <Guesser />
    </div>
  </div>
</template>

<script>

//import Board from './components/Board.vue'
import Hed from './components/Hed.vue'
import Guesser from './components/Guesser.vue'
import Mesg from './components/Mesg.vue'

import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      loading: false,
    }
  },

  computed: {
    ...mapGetters('game', ['word']),
    noGame() {
      return !this.word
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
    }

  },

  components: {
    //Board,
    Hed,
    Guesser,
    Mesg
  }
}

</script>
