expect = require('chai').expect
path = require 'path'

WorldMapViewer = require path.join(loadPath, 'viewers', 'world-map-viewer')

describe 'WorldMapViewer', ->
  [viewer] = []

  before ->
    viewer = new WorldMapViewer

  it 'should have a map generator', ->
    expect(viewer.generator).not.to.equal undefined

  it 'should allow you to select an area', ->
    area = viewer.area(-2, -2, 2, 2)
    expect(area.tiles.length).to.equal 25

  it 'should generate a height map', ->
    area = viewer.area(-2, -2, 2, 2)
    for height in area.heightMap
      expect(height.height).to.equal 13
