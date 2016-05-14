assocPath = require 'ramda/src/assocPath'
redux = require './redux'
defaultModel =
  logs: [],
  filters:
    location: 'all'
    tag: 'all'

module.exports = redux (model = defaultModel, action) =>
  console.log 'UPDATE', action
  switch action.type
    when 'SET_LOGS' then assocPath ['logs'], action.logs, model
    when 'NEW_LOG' then assocPath ['logs'],[model.logs..., action.log], model
    when 'SET_LOCATION_FILTER' then assocPath ['filters', 'location'], action.filter, model
    when 'SET_TAG_FILTER' then assocPath ['filters', 'tag'], action.filter, model
    else model
