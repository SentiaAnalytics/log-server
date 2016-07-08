rethink = require './rethink'
config = require './config'
r = require 'rethinkdb'
{merge, evolve, split} = require 'ramda'
dgram = require 'dgram'

module.exports = server = dgram.createSocket 'udp4'

server.on 'listening', () =>
  address = server.address()
  console.log 'UDP Server listening on ', address.address, ":", address.port

server.on 'message', (buffer, remote) =>
  data = evolve {tags: split ':'}, merge timestamp: new Date(), from: remote, JSON.parse buffer
  console.log "#{remote.address}:#{remote.port} - #{buffer.toString()}"

  rethink.run r.table('logs').insert data
