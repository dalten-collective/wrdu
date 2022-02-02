<template>
   <button class="btn rite hover:opacity-90 hover:shadow-none" @click="startGame">
    start 
      &#128880;
    game
   </button>
</template>

<script>
export default {
  methods: {
    startGame() {
      this.$store.dispatch('game/startGame')
    }
  },
}
</script>
