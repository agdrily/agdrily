expect = require('chai').expect
path = require 'path'

LevelMap = require path.join(loadPath, 'objects', 'level-map')

describe 'LevelMap', ->
  it 'should generate a level map', ->
    lm = new LevelMap(1, 1, 4, 13)
    expect(lm.x).to.equal(1)

  it 'should have generate a colony core tile', ->
    lm = new LevelMap(1, 1, 4, 13)
    expect(lm.levels[0]).to.equal 0
    expect(lm.levels[1]).to.equal 0
    expect(lm.levels[2]).to.equal 0
    expect(lm.levels[3]).to.equal 0
    expect(lm.levels[4]).to.equal 1
    expect(lm.levels[5]).to.equal 1
    expect(lm.levels[6]).to.equal 1
    expect(lm.levels[7]).to.equal 1
    expect(lm.levels[8]).to.equal 1
    expect(lm.levels[9]).to.equal 1
    expect(lm.levels[10]).to.equal 1
    expect(lm.levels[11]).to.equal 1
    expect(lm.levels[12]).to.equal 1
    expect(lm.levels[13]).to.equal 1
    expect(lm.levels[14]).to.equal 0
    expect(lm.levels[15]).to.equal 0
    expect(lm.levels[16]).to.equal 0
    expect(lm.levels[17]).to.equal 0
    expect(lm.levels[18]).to.equal 0
    expect(lm.levels[19]).to.equal 0

  it 'should generate an ocean', ->
    lm = new LevelMap(1, 1, 4, 10)
    expect(lm.levels[0]).to.equal 0
    expect(lm.levels[1]).to.equal 0
    expect(lm.levels[2]).to.equal 0
    expect(lm.levels[3]).to.equal 0
    expect(lm.levels[4]).to.equal 1
    expect(lm.levels[5]).to.equal 1
    expect(lm.levels[6]).to.equal 1
    expect(lm.levels[7]).to.equal 1
    expect(lm.levels[8]).to.equal 1
    expect(lm.levels[9]).to.equal 1
    expect(lm.levels[10]).to.equal 1
    expect(lm.levels[11]).to.equal 2
    expect(lm.levels[12]).to.equal 2
    expect(lm.levels[13]).to.equal 2
    expect(lm.levels[14]).to.equal 0
    expect(lm.levels[15]).to.equal 0
    expect(lm.levels[16]).to.equal 0
    expect(lm.levels[17]).to.equal 0
    expect(lm.levels[18]).to.equal 0
    expect(lm.levels[19]).to.equal 0

  it 'should calculate the height', ->
    low = new LevelMap(1, 1, 4, 13)
    expect(low.height()).to.equal 13

    high = new LevelMap(1, 1, 4, 17)
    expect(high.height()).to.equal 17

    ocean = new LevelMap(1, 1, 4, 10)
    expect(ocean.height()).to.equal 13
