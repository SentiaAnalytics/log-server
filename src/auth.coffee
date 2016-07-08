config = require './config'
basicAuth = require 'basic-auth'

module.exports = (req, res, next) ->
  user = basicAuth req

  if user && user.name == 'sentia' && user.pass == config.password
     return next()
  else
    res.set 'WWW-Authenticate', 'Basic realm=Authorization Required'
    res.status(401).send()
