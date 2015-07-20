MapGenerator = require '../generators/map'
sodb = require 'sodb'

class WorldMapViewer

  constructor: ->
    @generator = new MapGenerator('agdrily')

  area: (minX, minY, maxX, maxY) ->
    obj = {
      heightMap: new sodb()
    }
    obj.tiles = @generator.map.where({x: {gte: minX}}, {y: {gte: minY}}, {x: {lte: maxX}}, {y: {lte: maxY}})
    for tile in obj.tiles
      obj.heightMap.add({x: tile.x, y: tile.y, height: tile.object.height()})

    return obj

module.exports = WorldMapViewer
