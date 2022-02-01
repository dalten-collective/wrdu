<template>
  <div>
    <div v-for="h in how" :key="h.secs">
      <Rite :rite="h.rite" :test="h.test" />
    </div>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import Rite from './Rite.vue'

export default {
  computed: {
    ...mapGetters('game', [
      'how'
    ]),
  },
  components: {
    Rite
  }
}
</script>
