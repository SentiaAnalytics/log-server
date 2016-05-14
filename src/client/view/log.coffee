React = require 'react'
map = require 'ramda/src/map'
D = require 'date-fp'

renderTag = (tag) =>
  console.log 'TAG', tag
  <span key={tag}><span className="label label-primary">{tag}</span> </span>


module.exports = React.createClass

  getInitialState: () ->
    expanded: false

  toggle: () ->
    this.setState expanded: !this.state.expanded

  render: () ->
    props = this.props
    {expanded} = this.state
    console.log 'LOG', props
    payload = JSON.stringify props.payload, null, 2
    <article key={props.id} className="list-group-item">
      <h4 className="space-between"><small>{D.format 'YYYY-MM-DD HH:mm:ss.SSS', new Date(props.timestamp)}</small> <span>{props.from.address}</span></h4>
      <div className="space-between m-b-10">
        <div>
          {map renderTag, props.tags}
        </div>
        <div>
          <button onClick={this.toggle} className={"btn btn-xs btn-default #{if expanded then 'active' else ''}"}> show details</button>
        </div>
      </div>
      { if expanded
          <pre>
            {payload}
          </pre>
        else
          ''
      }
    </article>
