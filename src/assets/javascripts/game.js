let socket = new Amber.Socket('/game')
socket.connect()
  .then(() => {})

let channel = socket.channel('')

