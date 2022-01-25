const {default: axios} = require("axios")

axios.post('http://localhost:12321', {
  source: {
    dojo: '+hood/merge %wrdu our %base'
  },
  sink: {
    app: "hood",
  }
}).then((r) => {
  console.log(r.data)
})

axios.post('http://localhost:12321', {
  source: {
    dojo: '+hood/mount %wrdu'
  },
  sink: {
    app: "hood",
  }
}).then((r) => {
  console.log(r.data)
})

// TODO: exit

//axios.post('http://localhost:12321', {
  //source: {
    //dojo: '+hood/exit'
  //},
  //sink: {
    //app: "hood",
  //}
//}).then((r) => {
  //console.log(r.data)
//})
