React = require 'react'
map = require 'ramda/src/map'
sort = require 'ramda/src/sort'
curry = require 'ramda/src/curry'
split = require 'ramda/src/split'
contains = require 'ramda/src/contains'
renderLog = require './log'

sortLogs = sort ((a, b) => b.timestamp - a.timestamp)

filterLogs = curry ({location, tag}, logs) =>
  console.log 'TAG', tag
  console.log 'tags', if logs.length > 0 then (split ':', logs[0]?.tags) else ''

  logs.filter (log) =>
    switch
      when location != 'all' and log.from.address != location then false
      when tag != 'all' and !(contains tag, split ':', log.tags) then false
      else true


module.exports = ({logs:_logs, filters}) =>
  logs = (filterLogs filters) sortLogs _logs
  <ul className="list-group">
    {map renderLog, logs}
  </ul>
