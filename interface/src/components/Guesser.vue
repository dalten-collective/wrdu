<template>
  <div>
    <input class="text-black" type="text" v-model="guess" />
    <button @click="sendGuess">
      Guess
    </button>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      guess: '',
    }
  },

  computed: {
    ...mapGetters('game', [
      'spaces', 'word', 'mean'
    ]),
  },

  methods: {
    sendGuess() {
      this.$store.dispatch('game/sendGuess', this.guess)
    },
  },
}
</script>
