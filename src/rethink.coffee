rethinkdb = require 'oolon-rethink'
config = require './config'

console.log 'RETHINK', config.rethinkdb
module.exports = rethinkdb config.rethinkdb
