import gameApi from '../api/game'
import playApi from '../api/play'

export default {
  namespaced: true,
  state () {
    return {
      alow: 6,
      meme: {},
      open: null,
      how: {},
      wen: 0,
      mesg: '',
      mesgTimer: null,
      win: null,
      emos: '',
      // wat has been moved to getters onley
    }
  },

  mutations: {
    setMesg(state, payload) {
      state.mesg = payload
    },
    setMeme(state, payload) {
      state.meme = payload
    },
    setWat(state, payload) {
      state.wat = payload
    },
    setHow(state, payload) {
      state.how = payload
    },
    setWen(state, payload) {
      state.wen = payload
    },
    setWin(state, payload) {
      state.win = payload
    },
    setOpen(state, payload) {
      state.open = payload
    },
    setEmos(state, payload) {
      state.emos = payload
    },
  },

  getters: {
    alow(state) {
      return state.alow
    },
    wat(state, getters) {
      if (getters?.open?.wat) {
        return getters.open.wat
      } else {
        return {
          wat: {
            word: '',
            long: 0,
            mean: '',
          },
        }
      }
    },
    open(state) {
      return state.open
    },
    spaces(state, getters) {
      return getters.wat.long
    },
    word(state, getters) {
      return getters.wat.word
    },
    mean(state, getters) {
      return getters.wat.mean
    },
    how(state, getters) {
      return getters.open.how
    },
    mesg(state) {
      return state.mesg
    },
    granRite(_, getters) {
      const lettRiteMapping = {}
      // For all instances of rite (oldest to newest), set each letter's rating
      for (const [_, v] of
        (Object.entries(getters.how).slice().sort((a, b) => a.secs - b.secs))
      ){
        const rites = v.rite.split('')
        const letts = v.test.split('')
        letts.forEach((l, i) => {
          // TODO: check if already seen
          const score = rites[i]
          const existing = lettRiteMapping[l]

          // Upgrade previous scores
          if (existing) {
            if (existing === 'o' && score === 'n') {
              lettRiteMapping[l] = score
            }
            if (existing === 'n' && score === 'x') {
              lettRiteMapping[l] = score
            }
          } else {
            lettRiteMapping[l] = score
          }
        })
      }
      return lettRiteMapping
    },
    win(state) {
      //return true // TODO
      return state.win
    },
    newReady(state, getters) {
      if (state.open === null && getters.win === null) {
        return true
      }
      return false
    },
    endState(state, getters) {
      if (state.open === null) {
        return true
      }
      if (getters.win === null) {
        return false
      }
      return true
    },
    emos(state) {
      //return "⬛⬛⬛⬛\r\n🟩🟩🟨🟨\r\n🟨🟩🟨🟨\r\n🟩🟩🟩🟩\r\n"
      return state.emos
    },
  },

  actions: {
    clearMesg({ commit }) {
      commit('setMesg', '')
    },

    setMesg({ commit, dispatch }, payload) {
      commit('setMesg', payload)
      setTimeout(() => {
        dispatch('clearMesg')
      }, 3000)
    },

    setEmos({ commit }, payload) {
      if (payload.emos) {
        commit('setEmos', payload.emos)
      }
    },

    setWin({ commit }, payload) {
      commit('setWin', payload)
    },
    setMeme({ commit }, payload) {
      if (payload.meme) {
        commit('setMeme', payload.meme)
      }
    },
    setOpen({ commit }, payload) {
      if (!payload.open) {
        commit('setOpen', payload.open)
        return
      }
      const open = payload.open

      commit('setOpen', open)
      commit('setWen', open.wen)

      if (open.win === null) {
        commit('setWin', null)
      } else {
        commit('setWin', open.win)
      }
    },

    startGame() {
      gameApi.startGame()
    },

    shrug() {
      gameApi.shrug()
    },

    sendGuess({commit}, gues) {
      playApi.guess(gues)
    },

  },
}

