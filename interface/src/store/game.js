import gameApi from '../api/game'

export default {
  namespaced: true,
  state () {
    return {
      meme: {},
    }
  },

  mutations: {
    setMeme(state, payload) {
      state.meme = payload
    },
  },

  getters: {
  },

  actions: {
    setMeme({ commit }, payload) {
      commit('setMeme', payload)
    },

    startGame({ commit }) {
      gameApi.startGame()
    }

  },
}

