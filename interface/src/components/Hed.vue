<template>
  <div class="px-2 pb-2">
    <div class="flex items-center justify-between text-center">
      <div class="flex-1 text-left">
        <button class="color">
          <span class="text-2xl">&#x2706;</span>
        </button>
      </div>
      <div class="flex-1 text-center">
        <h1 class="text-3xl font-bold">
          %wrdu
        </h1>
      </div>
      <div class="flex justify-end flex-1">
        <div class="flex">
          <!-- scores -->
        </div>
        <button @click="startGame" class="flex color">
          <span class="text-2xl" :class="done ? '' : ['opacity-30', 'cursor-default']">&#x21ba;</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'

export default {
  props: [
  ],
  computed: {
    ...mapGetters('game', [
      'how', 'spaces', 'done'
    ]),
  },
  methods: {
    startGame() {
      if (!this.done) {
        return
      }
      this.$store.dispatch('game/startGame')
      // or: import gameApi and call startGame directly
    }
  }
}
</script>
