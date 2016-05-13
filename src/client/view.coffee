map = require 'ramda/src/map'
sort = require 'ramda/src/sort'
split = require 'ramda/src/split'
D = require 'date-fp'
React = require 'react'

renderLog = (log) =>
  payload = if log.type == 'json' then JSON.stringify log.payload, null, 2 else log.payload
  <article key={log.id} className="list-group-item">
    <div className="space-between">
      <h4><small>{D.format 'YYYY-MM-DD HH:mm:ss.SSS', new Date(log.timestamp)}</small> {log.from.address}</h4>
      <h4>
      {map ((tag) => <span key={tag}><span className="label label-primary">{tag}</span> </span>), (split ':', log.tags)}
      </h4>
    </div>
    <pre>
      {payload}
    </pre>
  </article>
module.exports = (state) => React.createElement React.createClass
  getInitialState: () ->
    {logs: []}

  componentDidMount: () ->
    state.observe (model) =>
      console.log 'MODEL', model
      this.setState model

  render: () ->
    logs = sort ((a, b) => b.timestamp - a.timestamp), this.state.logs
    <div className="container-fluid">
      <h1>Sentia Logs</h1>
      <ul className="list-group">
        {map renderLog, logs}
      </ul>
    </div>
