import { createStore as createVuexStore } from 'vuex'

import ship from './ship'
import game from './game'

export const createStore = () => {
  return createVuexStore({
    modules: {
      ship: ship,
      game: game,
    },
  })
}

