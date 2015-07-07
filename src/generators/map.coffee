seedrandom = require 'seedrandom'
sodb = require 'sodb'

# MapGenerator
#
# Generates maps from the supplied seed
class MapGenerator
  rng: null

  # Construct a new MapGenerator
  #
  # @param {String} seed the map seed to use
  constructor: (@seed) ->
    @rngseed = @seed[3..6]
    @rng = seedrandom(@rngseed)

    @map = new sodb

    for i in [-3..2]
      for j in [-3..2]
        @map.add(@newLevelMap(i, j, 4, 13))


  # Create a new level map object
  #
  # @param {Integer} x the x co-ord of the level map
  # @param {Integer} y the y co-ord of the level map
  # @param {Integer} terrainStart the lowest terrain block (outer edge of agrdilly)
  # @param {Integer} terrainStop the highest terrain block
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

module.exports = MapGenerator
