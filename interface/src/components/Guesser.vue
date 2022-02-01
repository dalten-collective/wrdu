<template>
  <div>
    <!-- adjust focus based on index and backspace -->
    <input v-for="space in spaces" class="mr-2" :key="space" style="width: 32px; height: 32px;" type="text" maxlength="1" />
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
      guess: [],
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
