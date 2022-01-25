import urbitAPI from './urbitAPI'

export function openAirlock(onEvent, onClose) {
  urbitAPI.subscribe({
    app: 'wrdu',
    path: '/website',
    event: data => {
      onEvent(data)
    },
  }).then((sub) => {
    onClose(sub)
  })
}
