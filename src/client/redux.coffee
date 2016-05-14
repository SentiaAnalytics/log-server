without = require 'ramda/src/without'
forEach = require 'ramda/src/forEach'
clone = require 'ramda/src/clone'

module.exports = (reducer) =>
  observers = []
  state = reducer(undefined, type: 'NO_OP')
  dispatch = (action) =>
    state = reducer state, action
    forEach ((o) => o(state)), observers

  observe = (observer) =>
    observers = [observers..., observer]
    () =>
      observers = without [observer], observers
      null

  getState = () =>
    clone state

  {dispatch, observe, getState}
