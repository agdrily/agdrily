LevelMap = require '../objects/level-map'
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

    for i in [-2..2]
      for j in [-2..2]
        @map.add(new LevelMap(i, j, 4, 13))

module.exports = MapGenerator
