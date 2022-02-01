<template>
  <div>
    <pre>
      spaces: {{ spaces }}
      word: {{ word }}
      mean: {{ mean }}
      <How />
      <Mesg />
    </pre>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'
import How from './How.vue'
import Mesg from './Mesg.vue'

export default {
  computed: {
    ...mapGetters('game', [
      'spaces', 'word', 'mean', 'how'
    ]),
  },

  components: {
    How,
    Mesg
  },
}
</script>
