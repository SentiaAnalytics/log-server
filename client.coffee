PORT = 33333
HOST = '127.0.0.1'


dgram = require 'dgram'
message = new Buffer JSON.stringify
  tags: 'info:test',
  payload: 'hello world'

client = dgram.createSocket 'udp4'
client.send message, 0, message.length, PORT, HOST, (err, bytes) =>
  if err then throw err
  console.log "UDP message sent to #{HOST}:#{PORT}"
  client.close()
