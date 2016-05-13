rethink = require './rethink'
config = require './config'
rdb = rethink "#{config.rethink_host}:#{config.rethink_port}"
dgram = require 'dgram'

module.exports = server = dgram.createSocket 'udp4'

server.on 'listening', () =>
  address = server.address()
  console.log 'UDP Server listening on ', address.address, ":", address.port

server.on 'message', (buffer, remote) =>
  data = JSON.parse buffer
  rdb.insert 'logs', data
  console.log "#{remote.address}:#{remote.port} - #{data.tags} #{data.message}"
