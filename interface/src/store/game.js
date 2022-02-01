import gameApi from '../api/game'
import playApi from '../api/play'

export default {
  namespaced: true,
  state () {
    return {
      meme: {},
      wat: {
        word: '',
        long: 0,
        mean: '',
      },
      how: {
      },
      wen: 0,
      mesg: '',
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
  },

  getters: {
    spaces(state) {
      return state.wat.long
    },
    word(state) {
      return state.wat.word
    },
    mean(state) {
      return state.wat.mean
    },
    how(state) {
      return state.how
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
          lettRiteMapping[l] = rites[i]
        })
      }
      return lettRiteMapping
    },
  },

  actions: {
    setMesg({ commit }, payload) {
      commit('setMesg', payload)
    },
    setMeme({ commit }, payload) {
      commit('setMeme', payload)
    },
    setOpen({ commit }, payload) {
      commit('setWat', payload.wat)
      commit('setHow', payload.how)
      commit('setWen', payload.wen)
    },

    startGame() {
      gameApi.startGame()
    },

    sendGuess({commit}, gues) {
      playApi.guess(gues)
    },

  },
}

