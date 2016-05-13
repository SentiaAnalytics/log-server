toPairs = require 'ramda/src/toPairs'
map = require 'ramda/src/map'
join = require 'ramda/src/join'
axios = require 'axios'

querystring = (query) => join '&', map (join '='), toPairs query

exports.getLogs = (query) =>
  axios.get "/logs?#{querystring query}"
    .then ({data}) =>
      console.log 'LOGS', data
      data
    .catch (err) =>
      console.log 'ERR', err
