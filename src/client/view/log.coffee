React = require 'react'
map = require 'ramda/src/map'
split = require 'ramda/src/split'
D = require 'date-fp'
renderTag = (tag) =>
  console.log 'TAG', tag
  <span key={tag}><span className="label label-primary">{tag}</span> </span>
module.exports = (props) =>
  console.log 'LOG', props
  payload = JSON.stringify props.payload, null, 2
  <article key={props.id} className="list-group-item">
    <h4 className="space-between"><small>{D.format 'YYYY-MM-DD HH:mm:ss.SSS', new Date(props.timestamp)}</small> <span>{props.from.address}</span></h4>
      <h4>
      {map renderTag, props.tags}
      </h4>
    <pre>
      {payload}
    </pre>
  </article>
