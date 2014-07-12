angular.module("dartboard", [])
  .controller "DartboardController",

    class DartboardController

      lastScore: 0
      players: [{name: "foo", score: 501}]

      addPlayer: (name) ->
        @players.push(name: name, score: 501)
        console.log "Player #{name} has entered the game."

      # expects the format s1 or d15
      dartThrow: (e) ->
        dartHit   = e.target.id
        @lastScore = dartHit.slice(1,3) * @scoreMultiplier(dartHit[0])
        console.log dartHit

      scoreMultiplier: (type) ->
        switch type
          when "t" then 3 # triple
          when "d" then 2 # double
          else 1          # single

      removePlayer: (player) ->
        console.log "Removing #{player}"