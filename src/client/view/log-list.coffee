React = require 'react'
map = require 'ramda/src/map'
sort = require 'ramda/src/sort'
curry = require 'ramda/src/curry'
contains = require 'ramda/src/contains'
LogEntry = require './log'

sortLogs = sort ((a, b) => b.timestamp - a.timestamp)

renderLog = ({id, timestamp, payload, from, tags}) =>
    <LogEntry
      key={id}
      id={id}
      timestamp={timestamp}
      payload={payload}
      from={from}
      tags={tags}
    />

filterLogs = curry ({location, tag}, logs) =>
  console.log 'TAG', tag

  logs.filter (log) =>
    switch
      when location != 'all' and log.from.address != location then false
      when tag != 'all' and !(contains tag,  log.tags) then false
      else true


module.exports = ({logs:_logs, filters}) =>
  logs = (filterLogs filters) sortLogs _logs
  console.log 'LOGS', logs
  <ul className="list-group">
    {map renderLog, logs}
  </ul>
