<template>
  <div>
    <div class="m-auto" style="max-width: 17rem;" >
      <div style="display: grid; grid-gap: 5px; padding: 10px;" :style="`grid-template-rows: repear(${ alow }, 1fr);`">
        <How />
        <Work :guess="guess" />
      </div>
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
      'spaces', 'word', 'mean', 'alow'
    ]),
    spacesToGues() {
      return this.guess.join('')
    },
  },

  methods: {
    updateSpaces(spaces) {
      this.guess = spaces
    },
    sendGues() {
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
