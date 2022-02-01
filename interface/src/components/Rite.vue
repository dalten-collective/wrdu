<template>
  <div>
    <div v-for="(c, i) in test.split('')" :key="i" :class="letterStyle(i)" class="inline-block">
      {{ c }}
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
    ...mapGetters('game', [
      'how'
    ]),
  },
  methods: {
    letterStyle(index) {
      const rating = this.rite.split('')[index]
      switch (rating) {
        case 'o':  // miss
          return ['miss']
        case 'n':  // close
          return 'clos'
        case 'x':  // exact
          return 'rite'
      }
    }
  },
}
</script>

<style scoped>
  .miss {
    background-color: grey;
  }
  .clos {
    background-color: yellow
  }
  .rite {
    background: green;
  }
</style>
