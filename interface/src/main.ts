import { createApp } from 'vue'
import App from './App.vue'
import './assets/tailwind.css'

// import vClickOutside from 'click-outside-vue3'

import { createStore } from 'vuex'

// import UrbitInterface from '@urbit/http-api'; // for typescript
import connector from '@urbit/http-api';

const urbitAPI = new connector('', '')

const store = createStore({
  state () {
  },
  mutations: {
  },

  getters: {
  },

  actions: {
  },

})

const app = createApp(App)

app.config.globalProperties.$filters = {
  date(date: Date) {
    return date.toLocaleString('default', {
      year: 'numeric',
      month: 'numeric',
      day: 'numeric',
    })
  },
}

// app.use(vClickOutside)
app.use(store)
app.config.globalProperties.urbitAPI = urbitAPI
app.config.globalProperties.shipName = window.ship

app.mount('#app')
