import { createApp } from 'vue'
import App from './App.vue'
import './assets/tailwind.css'

import { createStore } from './store'

// import vClickOutside from 'click-outside-vue3'

// import UrbitInterface from '@urbit/http-api'; // for typescript
import connector from '@urbit/http-api';

const urbitAPI = new connector('', '')

const app = createApp(App)
const store = createStore(app)

app.config.globalProperties.$filters = {
  date(date) {
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
