<template>
  <div>
    <!-- adjust focus based on index and backspace -->
    <!-- <input v-for="space in spaces" class="mr-2" :key="space" style="width: 32px; height: 32px;" type="text" maxlength="1" /> -->
    <!--
    <div v-for="letter in guess" :key="letter">
      {{ letter }}
    </div>
    -->
    <Work :spaces="guess" />
    <GuessBoard @updateSpaces="updateSpaces" @sendGues="sendGues" ref="bord" />
    <input v-model="testGuess" />
    <button @click="sendGues">
      Guess
    </button>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import GuessBoard from './GuessBoard.vue'
import Work from './Work.vue'

export default {
  data() {
    return {
      testGuess: "",
      guess: [],
    }
  },

  computed: {
    ...mapGetters('game', [
      'spaces', 'word', 'mean'
    ]),
    spacesToGues() {
      return this.guess.join('')
    },
  },

  methods: {
    updateSpaces(spaces) {
      console.log('got ', spaces)
      this.guess = spaces
    },
    sendGues() {
      console.log('sending ', this.spacesToGues)
      this.$store.dispatch('game/sendGuess', this.spacesToGues).then(() => {
        this.clearWork()
      })
    },

    clearWork() {
      this.$refs.bord.clear()
    }
  },

  components: {
    GuessBoard,
    Work
  },
}
</script>
