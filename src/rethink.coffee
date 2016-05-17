rethinkdb = require 'oolon-rethink'
config = require './config'

module.exports = rethinkdb "#{config.rethinkdb}/sentia"
