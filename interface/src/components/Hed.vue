<template>
  <div class="px-2 py-1">
    <div class="flex items-center justify-between text-center">
      <div class="flex-1 text-left">
        <button @click="showHelp = true" class="mr-2 color">
          <span class="text-2xl">🜷</span>  <!-- help -->
        </button>
        <button @click="!mean ? '' : showHint = true" class="color" :class="mean ? '' : ['opacity-30', 'cursor-default']">
          <span class="text-2xl">&#128768;</span> <!-- hint -->
        </button>
        <button @click="shrug">givup</button>
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
          <span class="text-2xl" :class="done ? '' : ['opacity-30', 'cursor-default']">
          &#128880;
          </span>
        </button>
        <!-- crown: &#128818; -->
      </div>
    </div>

    <div v-if="showHint" class="absolute w-1/2 h-1/2 top-1/4 left-1/4">
      <div class="flex flex-col p-2 pb-6 rounded-sm shadow-lg bg-light color">
        <div class="text-right">
          <button @click="showHint = false">
            &#128881;
          </button>
        </div>
        <div v-if="!reallyShowHint">
          <p class="color-dark">Are you sure you want a hint?</p>
          <p class="font-bold text-center"><span class="mr-2 cursor-pointer green-text" @click="reallyShowHint = true">Yes</span> <span class="cursor-pointer" @click="showHint = false">No</span></p>
        </div>
        <div v-else>
          <p class="color-dark">{{ mean }}</p>
        </div>
      </div>
    </div>

    <div v-if="showHelp" class="absolute w-1/2 h-1/2 top-1/4 left-1/4">
      <div class="flex flex-col p-2 pb-6 rounded-sm shadow-lg bg-light color">
        <div class="text-right">
          <button @click="showHelp = false">
            &#128881;
          </button>
        </div>
        <div>
          <p class="color-dark">Help coming soon...</p>
          <p class="mt-4 color-dark">Another fine <a class="underline green-text" href="https://dalten.org" target="_blank">dalten collective</a> product.</p>
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
      'how', 'spaces', 'done', 'mean'
    ]),
  },

  data() {
    return {
      showHint: false,
      reallyShowHint: false,
      showHelp: false,
    }
  },

  methods: {
    startGame() {
      if (!this.done) {
        return
      }
      this.$store.dispatch('game/startGame')
      // or: import gameApi and call startGame directly
    },

    shrug() {
      this.$store.dispatch('game/shrug')
    }
  }
}
</script>
