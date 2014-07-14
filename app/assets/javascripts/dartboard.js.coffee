angular.module("dartboard", [])
  .controller "DartboardController",

    class DartboardController

      lastScore: 0
      players: []
      currentPlayer: {}

      addPlayer: (name) ->
        player = { name: name, score: 501, shots: [], isActive: "" }
        @players.push(player)
        @setCurrentPlayer(player)
        console.log "Player #{name} has entered the game."

      setCurrentPlayer: (player) ->
        @currentPlayer.isActive = ""
        @currentPlayer = player
        @currentPlayer.isActive = "active"

      # expects the format s1 or d15
      dartThrow: (e) =>
        dartHit = e.target.id

        unless dartHit == "dartboard"
          # TODO: handle bullseye etc
          score = dartHit.slice(1,3) * @scoreMultiplier(dartHit[0])
          @updateScore(@currentPlayer, score)

      scoreMultiplier: (type) ->
        switch type
          when "t" then 3 # triple
          when "d" then 2 # double
          else 1          # single

      updateScore: (player, score) ->
        unless _.isEmpty(player)
          @lastScore    = score
          player.score -= score
          player.shots.push(score)

      removePlayer: (player) ->
        console.log "Removing #{player}"
