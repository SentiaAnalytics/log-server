{flip} = require 'ramda'
db = require './rethink'
r = require 'rethinkdb'
express = require 'express'
socketIO = require 'socket.io'
http = require 'http'
auth = require './auth'
app = express()
server = http.Server app
io = socketIO server

(flip db.each) r.table('logs').changes(), (err, change) ->
  if !err && change.old_val == null
    io.emit 'NEW_LOG', change.new_val

app.use auth
app.use express.static 'public'

app.get '/logs', (req, res) =>
  db.toArray r.table('logs').orderBy({index: r.desc('timestamp')}).limit(200)
    .then (logs) =>
      console.log 'LOGS', logs
      res.send logs
    .catch (err) =>
      console.log 'ERROR', err
      res.status(500).send(err)

module.exports = server
