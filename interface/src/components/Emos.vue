<template>
  <div>
    <div style="line-height: 1.1em; letter-spacing: 0.1em;" v-html="emosToHtml"></div>
    <div>
      <textarea hidden :value="copyFieldValue" ref="copyField" readonly @focus="$event.target.select()" />
      <button @click="copyEmos">
        Copy result
      </button>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters('game', ['emos']),
    emosToHtml() {
      return this.emos.replace(/\n/g, '</br>')
    },
    copyFieldValue() {
      return `%wrdu ${ this.hoonedDate }\n${ this.emos }`
    },
    hoonedDate() {
      const d = new Date
      // Hoonify year (2022 => 2.022)
      const year = d.getFullYear().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      var month = (d.getMonth() + 1)
      if (month < 10) {
        month = `0${ month }`
      }
      var day = (d.getMonth() + 1)
      if (day < 10) {
        day = `0${ day }`
      }
      return `${ year }-${ month }-${ day }`
    },
  },

  methods: {
    copyEmos() {
      this.$refs.copyField.focus()
      document.execCommand('copy')
    },
  },
}
</script>
