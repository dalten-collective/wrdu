<template>
  <div class="flex-col justify-center">
    <div v-for="(row, i) in rows" :key="row[0]" style="margin: 0 auto 8px;" class="flex justify-center w-100">
      <div v-if="i == 1" style="flex: 0.5;">
      </div>

      <button v-if="i == 2" @click="sendGues" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0; flex: 1.5;" class="flex items-center content-center font-bold text-center capitalize bg-gray-500 cursor-pointer norm rounded-md keyText">enter</button>

      <button @click="appendLetter(letter)" v-for="letter in row" :key="letter" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0;" class="flex items-center content-center flex-1 font-bold text-center capitalize bg-gray-500 cursor-pointer rounded-md keyText" :class="letterStyle(letter)">
        {{ letter }}
      </button>

      <button @click="popLetter" v-if="i == 2" style="border-radius: 4px; height: 58px; margin: 0 6px 0 0; flex: 1.5;" class="flex items-center content-center font-bold text-center capitalize bg-gray-500 cursor-pointer norm rounded-md keyText">del</button>

      <div v-if="i == 1" style="flex: 0.5;">
      </div>
    </div>
  </div>
</template>

<script>

import { mapGetters } from 'vuex'

export default {
  props: [
    'rite', 'test'
  ],

  computed: {
    ...mapGetters('game', [ 'granRite' ]),
    currentSpace() {
      return 0
    },
  },

  data() {
    return {
      currentGues: [],
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
    sendWork() {
      this.$emit('updateSpaces', this.currentGues)
    },

    sendGues() {
      this.$emit('sendGues')
    },

    appendLetter(letter) {
      this.currentGues.push(letter)
      this.sendWork()
    },

    popLetter() {
      this.currentGues.pop()
      this.sendWork()
    },

    clear() {
      this.currentGues = []
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
