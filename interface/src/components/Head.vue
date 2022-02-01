<template>
  <div>
    <div class="flex justify-between">
      <div class="flex-shrink">
        ?
      </div>
      <div class="flex-grow text-center">
        %wrdu
      </div>
      <div class="flex">
        <div class="flex">
          L
        </div>
        <div @click="startGame" class="flex">
          New
        </div>
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
      'how', 'spaces',
    ]),
  },
  methods: {
    startGame() {
      this.$store.dispatch('game/startGame')
      // or: import gameApi and call startGame directly
    }
  }
}
</script>
