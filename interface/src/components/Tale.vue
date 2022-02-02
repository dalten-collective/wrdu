<template>
  <div class="z-50 p-8 bg-red-300 md:px-44 modal-wrap">
    <!-- <div> -->
    <div class="shadow-lg rounded-md">
      <div v-if="win" class="flex flex-col items-center justify-around h-full">
        <div class="flex flex-col flex-grow">
          <div>
            <div class="mb-10">
              <h2 class="text-2xl text-center">
                You won
              </h2>
            </div>
          </div>
            <!-- TODO: meme -->
          <div class="mb-10">
            <Emos />
          </div>
        </div>
        <div class="flex flex-col flex-grow">
          <div>
            <NewGameButton />
          </div>
        </div>
      </div>
      <div v-else class="flex flex-col items-center justify-around h-full">
        <div class="flex flex-col flex-grow">
          <div>
            <div class="mb-10">
              <h2 class="text-2xl text-center">
                You lost
              </h2>
            </div>
          </div>
        <div class="flex flex-col flex-grow">
          <div>
            <NewGameButton />
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>

</template>

<script>
import { mapGetters } from 'vuex'

import Emos from './Emos.vue'
import NewGameButton from './new-game-button.vue'

export default {
  computed: {
    ...mapGetters('game', ['endState', 'win']),
  },
  components: {
    Emos,
    NewGameButton
  }
}
</script>
