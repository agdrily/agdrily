seedrandom = require 'seedrandom'
sodb = require 'sodb'

module.exports =
  class MapGenerator
    rng: null

    constructor: (@seed) ->
      @rngseed = @seed[3..6]
      @rng = seedrandom(@rngseed)

      @map = new sodb

      for i in [-3..2]
        for j in [-3..2]
          @map.add(@newLevelMap(i, j, 4, 13))


    newLevelMap: (x, y, terrainStart, terrainStop) ->
      levelMap = {
        x: x
        y: y
        levels: []
      }

      for i in [0..19]
        if (i < terrainStart || (i > terrainStop and i > 13))
          levelMap.levels[i] = 0
        else
          if i < 13 and i > 9 and terrainStop < i
            levelMap.levels[i] = 2
          else
            levelMap.levels[i] = 1

      return levelMap
