angular.module("dartboard")
  .controller "PlayerController",

    class PlayerController

      constructor: (@gameService) ->
        @name = @gameService.name

      addPlayer: (name) ->
        @gameService.addPlayer(name)
        @name = ""

      setCurrentPlayer: (player) ->
        @gameService.setCurrentPlayer(player)

      currentPlayerName: ->
        if @gameService.hasCurrentPlayer()
          "#{@gameService.currentPlayerName()}'s turn"
        else
          "Dart Score"

      currentPlayerTurn: ->
        @gameService.currentPlayerTurn()

      winItMessage: ->
        @gameService.winItMessage()

      players: ->
        @gameService.players
