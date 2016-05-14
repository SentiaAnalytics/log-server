{dispatch} = require '../state'

exports.setLocationFilter = (filter) =>
  dispatch
    type: 'SET_LOCATION_FILTER'
    filter: filter

exports.setTagFilter = (filter) =>
  dispatch
    type: 'SET_TAG_FILTER'
    filter: filter
