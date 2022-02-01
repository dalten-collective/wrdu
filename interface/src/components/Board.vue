<template>
  <div>
    <pre>
      spaces: {{ spaces }}
      word: {{ word }}
      mean: {{ mean }}
    </pre>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('game', [
      'spaces', 'word', 'mean'
    ]),
  }
}
</script>
