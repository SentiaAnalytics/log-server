without = require 'ramda/src/without'
forEach = require 'ramda/src/forEach'

module.exports = (reducer) =>
  observers = []
  model = {}
  dispatch = (action) =>
    model = reducer model, action
    forEach ((o) => o(model)), observers

  observe = (observer) =>
    observers = [observers..., observer]
    () =>
      observers = without [observer], observers
      null

  {dispatch, observe}
