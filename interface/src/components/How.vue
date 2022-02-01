<template>
  <div v-for="(a, i) in alow" :key="i">

    <Rite v-if="!riteAtIndex(a)" :rite="riteAtIndex(a).rite" :test="riteAtIndex(a).test" />
    <div v-else>
      <div :style="`grid-template-columns: repeat(${ spaces }, 1fr);`" style="display: grid; grid-gap: 5px;">
        <div v-for="i in spaces" :key="i"
          class="inline-flex items-center justify-center font-bold capitalize align-middle border border-4 rite-tile"
          style="font-size: 2rem;"
        >
          &nbsp;
        </div>
      </div>
    </div>

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
        console.log('how: ', this.how[i])
        return this.how[i]
      }
      console.log('non')
      return false
    }
  },
  components: {
    Rite
  },
}
</script>
