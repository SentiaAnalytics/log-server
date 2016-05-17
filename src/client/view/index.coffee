React = require 'react'
LogList = require './log-list'
Filters = require './filters'
map = require 'ramda/src/map'
flatten = require 'ramda/src/flatten'
uniq = require 'ramda/src/uniq'
filter = require 'ramda/src/filter'

module.exports = (state) => React.createElement React.createClass
  getInitialState: () ->
    state.getState()

  componentDidMount: () ->
    state.observe (model) =>
      this.setState model

  render: () ->
    {logs, filters} = this.state
    uniquelocations = uniq map ((x) => x.from?.address), logs
    uniquetags = filter ((x) => x), uniq flatten map ((x) => x.tags), logs
    <div className="container-fluid">
      <h1>Sentia Logs</h1>
      <Filters locations={uniquelocations} tags={uniquetags} filters={filters}/>
      <LogList logs={logs} filters={filters}/>
    </div>
