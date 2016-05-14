React = require 'react'
LogList = require './log-list'
Filters = require './filters'
map = require 'ramda/src/map'
flatten = require 'ramda/src/flatten'
uniq = require 'ramda/src/uniq'
split = require 'ramda/src/split'
filter = require 'ramda/src/filter'

module.exports = (state) => React.createElement React.createClass
  getInitialState: () ->
    state.getState()
    
  componentDidMount: () ->
    state.observe (model) =>
      console.log 'MODEL', model
      this.setState model

  render: () ->
    {logs, filters} = this.state
    console.log 'STATE', this.state
    locations = uniq map ((x) => x.from?.address), logs
    tags = filter ((x) => x), uniq flatten map ((x) => split ':', x.tags), logs
    console.log 'locations', locations
    console.log 'tags',tags
    <div className="container-fluid">
      <h1>Sentia Logs</h1>
      <Filters locations={locations} tags={tags} filters={filters}/>
      <LogList logs={logs} filters={filters}/>
    </div>
