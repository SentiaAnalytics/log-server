rethink = require './rethink'
express = require 'express'
socketIO = require 'socket.io'
http = require 'http'

app = express()
server = http.Server app
io = socketIO server

rethink.changes 'logs'
  .then (changes) => changes.each (err, change) =>
    console.log 'CHANGE', change
    if change.old_val == null
      io.emit 'NEW_LOG', change.new_val

app.use express.static 'public'

app.get '/logs', (req, res) =>
  rethink.all 'logs'
    .then (logs) =>
      res.send logs
    .catch (err) =>
      res.status(500).send(err)

module.exports = server
