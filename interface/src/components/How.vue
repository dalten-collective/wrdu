<template>
  <div v-for="(a, i) in alow" :key="i">

    <Work v-if="i == guesCount" />
    <Rite v-else-if="riteAtIndex(a)" :rite="riteAtIndex(a).rite" :test="riteAtIndex(a).test" />

  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import Rite from './Rite.vue'
import Work from './Work.vue'

export default {
  computed: {
    ...mapGetters('game', [
      'how', 'alow', 'spaces'
    ]),
    guesCount() {
      return Object.keys(this.how).length
    },
  },
  methods: {
    riteAtIndex(i) {
      if (this.how.hasOwnProperty(i)) {
        return this.how[i]
      }
      return { rite: '', test: '' }
    }
  },
  components: {
    Rite,
    Work
  },
}
</script>
