angular.module("dartboard", [])
  .controller "DartboardController",

    class DartboardController
      name: ""
      numTurns:  3
      lastScore: 0
      players: []
      currentPlayer: {}

      addPlayer: (name) ->
        player = { name: name, score: 501, shots: [], isActive: "" }
        @players.push(player)
        @setCurrentPlayer(player)
        @name = ""

      setCurrentPlayer: (player) ->
        @currentPlayer.isActive = ""
        @currentPlayer = player
        @currentPlayer.isActive = "active"

      # expects the format s1 or d15
      dartThrow: (e) =>
        dartHit = e.target.id

        unless dartHit == "dartboard"
          score = dartHit.slice(1,3) * @scoreMultiplier(dartHit[0])
          @updateScore(@currentPlayer, score)

      scoreMultiplier: (type) ->
        switch type
          when "t" then 3 # triple
          when "d" then 2 # double
          else 1          # single

      updateScore: (player, score) ->
        unless _.isEmpty(player)
          
          player.score -= score
          player.shots.push(score)
          @lastScore    = score

      removePlayer: (player) ->
        console.log "Removing #{player}"

      getCurrentPlayerName: ->
        if _.isEmpty(@currentPlayer)
          "Player"
        else
          @currentPlayer.name

      undoLastThrow: ->
        if !_.isEmpty(@currentPlayer) && @currentPlayer.shots.length > 0
          @currentPlayer.score += @currentPlayer.shots.pop()
          @lastScore = (@currentPlayer.shots[@currentPlayer.shots.length-1] || 0)

