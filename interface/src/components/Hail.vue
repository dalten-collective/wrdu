<template>
  <div class="flex flex-col justify-center min-h-screen">
     <div class="flex justify-center">
      <NewGameButton />
     </div>
  </div>

</template>

<script>
import { mapGetters } from 'vuex'
import NewGameButton from './new-game-button.vue'

export default {
  computed: {
    ...mapGetters('game', ['endState', 'win']),
  },
  components: {
    NewGameButton
  }
}
</script>
