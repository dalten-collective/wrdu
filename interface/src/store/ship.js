import airlock from '../api'

export default {
  namespaced: true,
  state () {
    return {
      subscription: null,
    }
  },

  mutations: {
    setSubscription(state, payload) {
      state.subscription = payload
    },
    unsetSubscription(state) {
      state.subscription = null
    },
  },


  actions: {
    startAirlock({ commit, dispatch }) {
      airlock.openAirlock(
        (data) => {
          console.log('data ', data)
          dispatch('game/setMeme', data, { root: true })
          dispatch('game/setOpen', data, { root: true })
          //if (data.meme) {
            //dispatch('game/setMeme', data.meme, { root: true })
          //}
          //if (data.open) {
            //dispatch('game/setOpen', data.open, { root: true })
          //}
          if (data.mesg) {
            dispatch('game/setMesg', data.mesg, { root: true })
          } else {
            // dispatch('game/setMesg', '', { root: true })
          }
        },
        (sub) => {
          dispatch('setSubscription', sub)
        },
      )
    },

    setSubscription({ commit }, payload) {
      commit('setSubscription', payload)
    },

    closeAirlock({ commit, state }) {
      airlock.closeAirlock(
        state.subscription,
        commit('unsetSubscription')
      )
    },
  }
}


