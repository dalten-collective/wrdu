import { createStore as createVuexStore } from 'vuex'
import airlock from '../api'
import urbitAPI from '../api/urbitAPI'

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
      startAirlock({ commit, dispatch }) {
        airlock.openAirlock(
          (data) => {
            dispatch('setMeme', data.meme)
          },
          (sub) => {
            dispatch('setSubscription', sub)
          },
        )

        //console.log('subscription data: ', data)
      },

      setMeme({ commit }, payload) {
        commit('setMeme', payload)
      },

      setSubscription({ commit }, payload) {
        commit('setSubscription', payload)
      },

      // move to module?
      closeAirlock({ commit, state }) {
        urbitAPI
          .unsubscribe(state.subscription).then(() => {
            commit('unsetSubscription')
          })
      },

      // TODO: move to own store module
      startGame({ commit }) {
        // TODO: move to separate pokes api/moves-specific apis
        urbitAPI.poke({
          app: 'wrdu',
          mark: 'wrdu-game',
          json: {
            'start': {
              'leng': '%four',
            }
          }
        });
      }

    },
  })
}
