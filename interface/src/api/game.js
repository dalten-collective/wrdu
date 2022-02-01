import urbitAPI from './urbitAPI'

export default {
  startGame() {
    urbitAPI.poke({
      app: 'wrdu',
      mark: 'wrdu-game',
      json: {
        'start': {
          'leng': 'four',
        }
      }
    });
  }
}
