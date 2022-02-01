<template>
  <div :style="`grid-template-columns: repeat(${ spaces }, 1fr);`" style="display: grid; grid-gap: 5px;">

      <div v-for="(x, i) in spaces" :key="x"
      class="inline-flex items-center justify-center font-bold capitalize align-middle rite-tile tryy"
        style="font-size: 2rem;"
      >
        <span v-if="letterAtGuessIndex(i)">
          {{ letterAtGuessIndex(i) }}
        </span>
        <span v-else>
          &nbsp;
        </span>
      </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  props: {
    guess: {
      default: []
    }
  },
  computed: {
    ...mapGetters('game', [
      'spaces',
    ]),
  },

  methods: {
    letterAtGuessIndex(i) {
      if (this.guess.length > 0) {
        return this.guess[i]
      } else {
        return null
      }
    }
  },
}
</script>
