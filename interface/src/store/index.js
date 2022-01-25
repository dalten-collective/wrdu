import { createStore as createVuexStore } from 'vuex'

export const createStore = (app) => {
  return createVuexStore({
    state () {
      return {
        meme: {},
        subscription: null,
      }
    },

    mutations: {
      setMeme(state, payload) {
        state.meme = payload
      },
      setSubscription(state, payload) {
        state.subscription = payload
      },
      unsetSubscription(state) {
        state.subscription = null
      },
    },

    getters: {
    },

    actions: {
      setMeme({ commit }, payload) {
        commit('setMeme', payload)
      },

      setSubscription({ commit }, payload) {
        commit('setSubscription', payload)
      },

      unSub({ commit, state }) {
        app.config.globalProperties.urbitAPI.unsubscribe(state.subscription).then(() => {
          commit('unsetSubscription')
        })
      },
    },
  })
}
