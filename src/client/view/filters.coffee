React = require 'react'
curry = require 'ramda/src/curry'
map = require 'ramda/src/map'
{setLocationFilter, setTagFilter} = require '../actions/filter'


renderOption = (text) =>
  <option key={text} value={text}>{text}</option>

module.exports = (props) =>
  {locations, tags, filters} = props
  <div className="space-between well">
    <select className="form-control m-10" onChange={(e) => setTagFilter e.target.value}>
      {map renderOption, [tags..., 'all']}
    </select>
    <select className="form-control m-10" onChange={(e) => setLocationFilter e.target.value}>
    {map renderOption, [locations..., 'all']}
    </select>
  </div>
