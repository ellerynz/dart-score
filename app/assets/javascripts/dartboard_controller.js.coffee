angular.module("dartboard")
  .controller "DartboardController", (sharedProperties) ->

    showMe: (e) ->
      sharedProperties.dartHit(e.target.id)
