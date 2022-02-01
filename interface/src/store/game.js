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
    }
  },

  mutations: {
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
  },

  actions: {
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

