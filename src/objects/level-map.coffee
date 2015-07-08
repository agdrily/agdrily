class LevelMap
  # Create a new level map object
  #
  # @param {Integer} x the x co-ord of the level map
  # @param {Integer} y the y co-ord of the level map
  # @param {Integer} terrainStart the lowest terrain block (outer edge of agrdilly)
  # @param {Integer} terrainStop the highest terrain block
  constructor: (@x, @y, @terrainStart, @terrainStop) ->
    @levels = []

    for i in [0..19]
      if (i < @terrainStart || (i > @terrainStop and i > 13))
        @levels[i] = 0
      else
        if i < 13 and i > 9 and @terrainStop < i
          @levels[i] = 2
        else
          @levels[i] = 1

module.exports = LevelMap
