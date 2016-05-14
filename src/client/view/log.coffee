React = require 'react'
map = require 'ramda/src/map'
split = require 'ramda/src/split'
D = require 'date-fp'

module.exports = (props) =>
  payload = if props.type == 'json' then JSON.stringify props.payload, null, 2 else props.payload
  <article key={props.id} className="list-group-item">
      <h4 className="space-between"><small>{D.format 'YYYY-MM-DD HH:mm:ss.SSS', new Date(props.timestamp)}</small> <span>{props.from.address}</span></h4>
      <h4>
      {map ((tag) => <span key={tag}><span className="label label-primary">{tag}</span> </span>), (split ':', props.tags)}
      </h4>
    <pre>
      {payload}
    </pre>
  </article>
