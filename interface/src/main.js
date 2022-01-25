import { createApp } from 'vue'
import App from './App.vue'
import './assets/tailwind.css'

import { createStore } from './store'

const app = createApp(App)
const store = createStore(app)

app.use(store)

app.mount('#app')
