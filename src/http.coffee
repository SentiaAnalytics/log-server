express = require 'express'

module.exports = app = express()

app.use (req, res, next) =>
  console.log "#{req.method} #{req.hostname}"
  console.log 'HEADERS', req.headers
  next()

app.use express.static 'public'

app.get '/logs', (req, res) =>
  res.send [
      tags: 'info:test'
      type: 'json'
      message:
        msg: 'im some data'
    ,
      tags: 'info:stuff'
      type: 'json'
      message:
        msg: 'im am some stuff'
    ,
      tags: 'info:stuff'
      type: 'text'
      message: 'I am text'
  ]
