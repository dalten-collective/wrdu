<template>
  <div class="text-center">
    <span class="opacity-0">wrdu</span>
    <div class="mb-4" style="line-height: 1.1em; letter-spacing: 0.1em;" v-html="emosToHtml"></div>

    <div>
      <textarea class="hidden" :value="copyFieldValue" ref="copyField" readonly @focus="$event.target.select()" />

      <div class="mb-2">
        <button class="btn rite hover:opacity-90 hover:shadow-none" @click="copyEmos">
          share result
        </button>
      </div>

      <div v-if="showCopyNotice">
        <span class="yellow-text">result copied to clipboard!</span>
      </div>

      <div v-if="!showCopyNotice">
        <a v-if="!copyProblems" href="#" class="underline opacity-50" @click="copyProblems = true" >help</a>
        <a v-else href="#" class="underline" @click="copyProblems = false" >thanks</a>

        <div v-if="copyProblems">
          <div>
            <p>if the share button doesn't work for you, copy this field:</p>
            <textarea class="text-black" rows='8' :value="copyFieldValue" />
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      showCopyNotice: false,
      copyProblems: false,
    }
  },

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
      //this.$refs.copyField.focus()
      //document.execCommand('copy')

      navigator.clipboard.writeText(this.copyFieldValue);
      this.showCopyNotice = true
      setTimeout(() => {
        this.showCopyNotice = false
      }, 2500)
    },
  },
}
</script>
