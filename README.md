# %wrdu

`%wrdu` is named after the indo-aryan language urdu.
We made this game for our partner who loves word games.
This game is a love story.

## Urbit

The gall agent files are found in the `urbit` directory

## Interface

The Vue.js front end files are found in the `interface` directory

## Setup, Build and Deploy

- Urbit Setup instructions hints: `bin/setup.sh`
- TODO: automated setup with terran-control json API
- Install js dependencies: `bin/install-js-dependencies.sh`
- Create a `interface/.env` file; follow the example in `interface/.env.example`
- Serve the interface in dev mode locally: `bin/serve-interface.sh`
- The vite server should provide a link to the local site. something like
[http://localhost:3000/apps/wrdu/](http://localhost:3000/apps/wrdu/)

- Build the frontend: `bin/build-interface.sh`
- Glob the `interface/dist` result

## Common Problems

- If you have issues with Vite making the initial connection, try using your
local IP address rather than `localhost` in .env`.
