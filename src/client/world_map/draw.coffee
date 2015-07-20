gridSize = 50
mapMidX = 0
mapMidY = 0
mapData = {}
midWidth = 0
maxWidth = 0
midHeight = 0
maxHeight = 0

resize = ->
  $('#mainCanvas').attr('width', window.innerWidth)
  $('#mainCanvas').attr('height', window.innerHeight)
  draw()

draw = ->
  stage = new createjs.Stage("mainCanvas")

  stage.addChild(drawGrid())
  stage.addChild(drawTiles())

  stage.update()

drawGrid = ->
  maxWidth = $('#mainCanvas').attr('width')
  midWidth = maxWidth / 2
  maxHeight = $('#mainCanvas').attr('height')
  midHeight = maxHeight / 2

  grid = new createjs.Shape()
  lines = grid.graphics

  lines.beginStroke('#fff')
  lines.moveTo(0, midHeight)
  lines.lineTo(maxWidth, midHeight)
  lines.moveTo(midWidth, 0)
  lines.lineTo(midWidth, maxHeight)

  lineX = (midWidth - (gridSize / 2))
  lineX += gridSize * parseInt((lineX * gridSize) + 1)
  while lineX > 0
    lines.moveTo(lineX, 0)
    lines.lineTo(lineX, maxHeight)
    lineX -= gridSize

  lineY = (midHeight - (gridSize / 2))
  lineY += gridSize * parseInt((lineY * gridSize) + 1)
  while lineY > 0
    lines.moveTo(0, lineY)
    lines.lineTo(maxWidth, lineY)
    lineY -= gridSize

  return grid

drawTiles = ->
  tiles = new createjs.Container()

  for tile in mapData.tiles
    tiles.addChild(drawTile(tile))

  return tiles

drawTile = (tile) ->
  container = new createjs.Container()

  shape = new createjs.Shape()

  shape.x = ((midWidth - (gridSize / 2)) + (tile.x * gridSize))
  shape.y = ((midHeight - (gridSize / 2)) + (tile.y * gridSize))
  shape.graphics.beginFill('#f00')
  shape.graphics.drawRect(0,0,gridSize,gridSize)
  shape.tileData = tile

  container.addChild(shape)

  text = new createjs.Text("#{tile.x}, #{tile.y}", "10px", "#fff")
  text.x = shape.x + (gridSize / 2)
  text.y = shape.y + (gridSize / 2)

  container.addChild(text)

  text = new createjs.Text("#{tile.terrainStop}", "10px", "#fff")
  text.x = shape.x + (gridSize / 2)
  text.y = shape.y + (gridSize / 2) + 20

  container.addChild(text)

  return container

$(document).ready ->
  agdrily.worldMap (data) ->
    mapData = data
    resize()
    window.addEventListener('resize', resize, false);
