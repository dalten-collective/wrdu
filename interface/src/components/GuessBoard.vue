<template>
  <div class="flex-col justify-center">
    <div class="my-2 text-center">
      <input type="text" v-model="nativeKeys" id="nativeKeyInput" class="min-w-full px-2 text-center text-green-300 rounded-md bg-less-dark" placeholder="Tap here to use native keyboard" />
    </div>

    <div v-for="(row, i) in rows" :key="row[0]" style="margin: 0 auto 8px;" class="flex justify-center w-100">
      <div v-if="i == 1" style="flex: 0.5;">
      </div>

      <button v-if="i == 2" @click="sendGues" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0; flex: 1.5;" class="flex items-center content-center justify-center text-2xl font-bold text-center capitalize bg-gray-500 cursor-pointer norm rounded-md keyText">&#128797;</button>

      <button @click="appendLetter(letter)" v-for="letter in row" :key="letter" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0;" class="flex items-center content-center justify-center flex-1 font-bold text-center capitalize bg-gray-500 cursor-pointer rounded-md keyText" :class="letterStyle(letter)">
        {{ letter }}
      </button>

      <button @click="popLetter" v-if="i == 2" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0; flex: 1.5;" class="flex items-center content-center justify-center text-3xl font-bold text-center capitalize bg-gray-500 cursor-pointer norm rounded-md keyText">
        <span class="text-2xl">&#128848;</span>
        <!--
        <svg class="del-key" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
          <path d="M22 3H7c-.69 0-1.23.35-1.59.88L0 12l5.41 8.11c.36.53.9.89 1.59.89h15c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H7.07L2.4 12l4.66-7H22v14zm-11.59-2L14 13.41 17.59 17 19 15.59 15.41 12 19 8.41 17.59 7 14 10.59 10.41 7 9 8.41 12.59 12 9 15.59z"></path>
        </svg>
        -->

      </button>

      <div v-if="i == 1" style="flex: 0.5;">
      </div>
    </div>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'

// TODO: Handle keyboard input

export default {
  props: [
    'rite', 'test'
  ],

  mounted() {
    window.addEventListener('keyup', this.keyHandler)
    // set up from store:
    this.internalGues = this.gues
  },
  watch: {
    // Keep internal updated from store
    gues(val) {
      this.internalGues = val
    }
  },
  unmounted() {
    window.removeEventListener('keyup', this.keyHandler)
  },

  computed: {
    ...mapGetters('game', [
    'granRite', 'spaces', 'gues', 'guesString'
    ]),
    currentSpace() {
      return 0
    },
  },

  data() {
    return {
      internalGues: [],
      nativeKeys: '',
      rows: [
      [
        'q',
        'w',
        'e',
        'r',
        't',
        'y',
        'u',
        'i',
        'o',
        'p',
      ],
      [
        'a',
        's',
        'd',
        'f',
        'g',
        'h',
        'j',
        'k',
        'l',
      ],
      [
        'z',
        'x',
        'c',
        'v',
        'b',
        'n',
        'm',
        ]
      ]
    }
  },

  methods: {
    keyHandler(e) {
      if (this.rows.flat().includes(e.key)) {  // Any letter in our rows
        this.appendLetter(e.key)
      }
      if (e.keyCode === 13) { // 'Enter'
        this.sendGues()
      }
      if (e.keyCode === 8) {  // 'Backspace'
        this.popLetter()
      }
      if (e.keyCode === 191) {  // '?'
        this.popLetter()
      }
    },


    sendWork() {
      this.$store.dispatch('game/setGues', this.internalGues)
    },

    sendGues() {
      if (this.internalGues.length !== this.spaces) {
        return
      }
      this.$store.dispatch('game/sendGuess', this.guesString).then(() => {
        this.clear()
      })
    },

    appendLetter(letter) {
      if (this.internalGues.length === this.spaces) {
        return
      }
      this.internalGues.push(letter)
      this.sendWork()
    },

    popLetter() {
      this.internalGues.pop()
      this.sendWork()
    },

    clear() {
      this.internalGues = []
      this.nativeKeys = ''
      this.sendWork()
    },

    letterStyle(letter) {
      const rating = this.granRite[letter]
      switch (rating) {
        case 'o':  // miss
          return 'rong'
        case 'n':  // close
          return 'clos'
        case 'x':  // exact
          return 'rite'
        default:
          return 'norm'
      }
    }
  },
}
</script>

<style scoped>
  #nativeKeyInput::placeholder {
    color: var(--color-tone-4);
  }
  #nativeKeyInput {
    color: var(--color-tone-4);
  }
</style>
