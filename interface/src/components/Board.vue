<template>
  <div v-if="false">
    <pre v-if="false">
      spaces: {{ spaces }}
      word: {{ word }}
      mean: {{ mean }}
    </pre>
      <How />
  </div>
</template>

<script>

// TODO: unused?!

import { mapGetters } from 'vuex'
import How from './How.vue'

export default {
  computed: {
    ...mapGetters('game', [
      'spaces', 'word', 'mean', 'how'
    ]),
  },

  components: {
    How,
  },
}
</script>
