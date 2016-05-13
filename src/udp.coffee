rethink = require './rethink'
config = require './config'
{merge} = require 'ramda'
dgram = require 'dgram'

module.exports = server = dgram.createSocket 'udp4'

server.on 'listening', () =>
  address = server.address()
  console.log 'UDP Server listening on ', address.address, ":", address.port

server.on 'message', (buffer, remote) =>
  data = merge timestamp: Date.now(), from: remote, JSON.parse buffer
  console.log "#{remote.address}:#{remote.port} - #{buffer.toString()}"

  rethink.insert 'logs', data
