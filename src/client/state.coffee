redux = require './redux'
defaultModel = {logs: []}
module.exports = redux (model = defaultModel, action) =>
  switch action.type
    when 'SET_LOGS' then Object.assign {}, model, {logs: action.logs}
    when 'NEW_LOG' then Object.assign {}, model, {logs: [model.logs..., action.log]}
    else model
