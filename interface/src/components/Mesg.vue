<template>
  <div v-if="mesg" class="fixed w-full px-4 top-4">
    <div @click="clearMesg" class="flex justify-between py-2 text-center shadow-lg alert rounded-md">
      <div class="flex-grow pl-2 text-center">
        {{ mesg }}
      </div>
      <button @click="clearMesg" class="pr-2">
        &#128881;
      </button>
    </div>
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

  methods: {
    clearMesg() {
      this.$store.dispatch('game/clearMesg')
    }
  },
}
</script>
