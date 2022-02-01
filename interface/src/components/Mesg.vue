<template>
  <div class="text-red-400">
    {{ mesg }}
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('game', [
      'mesg'
    ]),
  },
}
</script>
