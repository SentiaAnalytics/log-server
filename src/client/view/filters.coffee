React = require 'react'
curry = require 'ramda/src/curry'
map = require 'ramda/src/map'
{setLocationFilter, setTagFilter} = require '../actions/filter'


renderOption = (text) =>
  <option key={text} value={text}>{text}</option>

module.exports = (props) =>
  {locations, tags, filters} = props
  <div className="space-between well">
    <label className="grow p-10">
      Tags
      <select className="form-control" onChange={(e) => setTagFilter e.target.value}>
        {map renderOption, [tags..., 'all']}
      </select>
    </label>
    <label className="grow p-10">
      Host
      <select className="form-control" onChange={(e) => setLocationFilter e.target.value}>
      {map renderOption, [locations..., 'all']}
      </select>
    </label>
  </div>
