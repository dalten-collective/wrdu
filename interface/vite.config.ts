import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue'
import { urbitPlugin } from '@urbit/vite-plugin-urbit';
//import path from 'path';

require('dotenv').config()
const target = process.env.WRDU_URBIT_TARGET

export default defineConfig({
  plugins: [ vue(), urbitPlugin({ base: 'wrdu', target }) ],
  build: {
    chunkSizeWarningLimit: 600,
    cssCodeSplit: false
  }
});
