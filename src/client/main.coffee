reactDom = require 'react-dom'
view = require './view'
api = require './api'
state = require './state'

socket.on 'NEW_LOG', (log) =>
  state.dispatch
    type: 'NEW_LOG'
    log: log

api.getLogs {}
  .then (logs) =>state.dispatch type: 'SET_LOGS', logs: logs

reactDom.render (view state), document.getElementById 'main'
