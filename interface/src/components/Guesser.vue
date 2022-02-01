<template>
  <div>
    <div style="display: grid; grid-template-rows: repeat(10, 1fr); grid-gap: 5px; padding: 10px;">
      <Work :guess="guess" />
      <How />
    </div>
    <GuessBoard @updateSpaces="updateSpaces" @sendGues="sendGues" ref="bord" />
  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import GuessBoard from './GuessBoard.vue'
import How from './How.vue'
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
    How,
    Work
  },
}
</script>
