<template>
  <Mesg />
  <Tale v-if="endState && !newReady" />

  <div v-if="false" class="text-red-600">
    DEBUG
    <button class="p-2 border rounded-md" @click="closeAirlock">close airlock</button>
  </div>
  <div id="app-container">

    <Hed class="border-b hed-border" />

    <Hail v-if="endState && newReady" />
    <Guesser v-if="!endState" />

  </div>
</template>

<script>

import Hail from './components/Hail.vue'
import Hed from './components/Hed.vue'
import Guesser from './components/Guesser.vue'
import Mesg from './components/Mesg.vue'
import Tale from './components/Tale.vue'

import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      loading: false,
    }
  },

  computed: {
    ...mapGetters('game', ['word', 'endState', 'emos', 'win', 'newReady']),
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

  },

  components: {
    //Board,
    Hail,
    Hed,
    Guesser,
    Mesg,
    Tale,
  }
}

</script>
