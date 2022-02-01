<template>
  <div v-for="(a, i) in alow - 1" :key="i">

    <Rite v-if="riteAtIndex(a)" :rite="riteAtIndex(a).rite" :test="riteAtIndex(a).test" />

  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import Rite from './Rite.vue'

export default {
  computed: {
    ...mapGetters('game', [
      'how', 'alow', 'spaces'
    ]),
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
    Rite
  },
}
</script>
