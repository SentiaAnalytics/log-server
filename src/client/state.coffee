assocPath = require 'ramda/src/assocPath'
assoc = require 'ramda/src/assoc'
evolve = require 'ramda/src/evolve'
map = require 'ramda/src/map'
curry = require 'ramda/src/curry'
redux = require './redux'
defaultModel =
  logs: [],
  filters:
    location: 'all'
    tag: 'all'

parseDates = evolve {timestamp: (d) => new Date d}

module.exports = redux (model = defaultModel, action) =>
  console.log 'UPDATE', action
  switch action.type
    when 'SET_LOGS' then assocPath ['logs'], (map parseDates, action.logs), model
    when 'NEW_LOG' then assocPath ['logs'],[model.logs..., parseDates action.log], model
    when 'SET_LOCATION_FILTER' then assocPath ['filters', 'location'], action.filter, model
    when 'SET_TAG_FILTER' then assocPath ['filters', 'tag'], action.filter, model
    else model
