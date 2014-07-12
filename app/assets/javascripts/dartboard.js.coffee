angular.module("dartboard", [])
  .service "sharedProperties", ->

    @lastScore = 0

    # expects the format s1 or d15
    dartHit: (dartTarget) ->
      console.log dartTarget
      lastScore = dartTarget.slice(1,3) * @scoreMultiplier(dartTarget[0])
      console.log lastScore

    scoreMultiplier: (type) ->
      switch type
        when "t" then 3
        when "d" then 2
        else 1
