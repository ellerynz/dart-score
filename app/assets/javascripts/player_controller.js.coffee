angular.module("dartboard")
  .controller "PlayerController", ($scope, sharedProperties) ->

    @newPlayer = {}
    @players = sharedProperties.players

    $scope.addPlayer: () ->
      console.log $scope.playerName
