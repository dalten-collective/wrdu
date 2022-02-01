<template>
  <div v-if="mesg" class="absolute top-0 w-full px-2 mt-6 h-1/2 ">
    <div class="flex justify-between py-2 text-center shadow-lg alert rounded-md">
      <div class="pl-2">
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
