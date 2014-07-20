angular.module("dartboard", [])
  .controller "DartboardController",

    class DartboardController
      name: ""
      miss: "Miss!"
      highestDouble: 40
      numTurns:  3
      lastScore: 0
      players: []
      currentPlayer: {}

      addPlayer: (name) ->
        player = { name: name, score: 501, turn: [], shots: [], isActive: "" }
        @players.push(player)
        @setCurrentPlayer(player)
        @name = ""

      setCurrentPlayer: (player) ->
        @currentPlayer.isActive = ""
        @currentPlayer = player
        @currentPlayer.isActive = "active"

      dartThrow: (e) =>
        return if _.isEmpty(@currentPlayer) || !e.target.id
        @playerTurn(@dartHit(e.target.id))

      dartHit: (location) ->
        if location == "dartboard"
          @updateScore(0)
          @miss
        else
          # Expects the format s1 or d15
          score = location.slice(1,3) * @scoreMultiplier(location[0])
          @updateScore(score)
          score

      playerTurn: (shot) ->
        @currentPlayer.turn = [] if @currentPlayer.turn.length >= 3
        @currentPlayer.turn.push(shot)

      scoreMultiplier: (type) ->
        switch type
          when "t" then 3 # Triple
          when "d" then 2 # Double
          else 1          # Single

      updateScore: (score) ->
        @currentPlayer.score -= score
        @currentPlayer.shots.push(score)
        @lastScore = score

      isScoreInDoubleRange: (score) ->
        score <= @highestDouble

      removePlayer: (player) ->
        console.log "Removing #{player}"

      getCurrentPlayerName: ->
        if _.isEmpty(@currentPlayer)
          "Yeezy motherfucker"
        else
          "#{@currentPlayer.name}'s turn"

      undoLastThrow: ->
        if !_.isEmpty(@currentPlayer) && @currentPlayer.shots.length > 0
          @currentPlayer.score += @currentPlayer.shots.pop()
          @undoLastTurn()
          @lastScore = (@currentPlayer.shots[@currentPlayer.shots.length-1] || 0)

      undoLastTurn: ->
        @currentPlayer.turn.pop()
        if @currentPlayer.turn.length == 0
          @currentPlayer.turn = @lastThreeShots()

      lastThreeShots: ->
        @currentPlayer.shots.slice(@currentPlayer.shots.length-3, @currentPlayer.shots.length)