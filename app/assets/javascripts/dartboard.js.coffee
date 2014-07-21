angular.module("dartboard")
  .controller "DartboardController",

    class DartboardController

      constructor: (@gameService) ->

      dartThrow: (e) =>
        @gameService.dartHit(e.target.id) unless !e.target.id

      miss: ->
        @gameService.dartHit()

      undo: ->
        @gameService.undoLastThrow()
