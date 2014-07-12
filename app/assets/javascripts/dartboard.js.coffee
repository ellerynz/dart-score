angular.module("dartboard", [])
  .controller "DartboardController",

    class DartboardController

      lastScore: 0
      players: [{name: "foo", score: 501, shots: []}]
      currentPlayer: {}

      addPlayer: (name) ->
        @players.push(name: name, score: 501, shots: [])
        console.log "Player #{name} has entered the game."

      setCurrentPlayer: (player) ->
        @currentPlayer = player

      # expects the format s1 or d15
      dartThrow: (e) =>
        dartHit = e.target.id

        unless dartHit == "dartboard"
          # TODO: handle bullseye etc
          @lastScore   = dartHit.slice(1,3) * @scoreMultiplier(dartHit[0])
          @updateScore(@currentPlayer, @lastScore)

      scoreMultiplier: (type) ->
        switch type
          when "t" then 3 # triple
          when "d" then 2 # double
          else 1          # single

      updateScore: (player, score) ->
        player.score -= score
        player.shots.push(score)

      removePlayer: (player) ->
        console.log "Removing #{player}"
