expect = require('chai').expect
path = require 'path'

MapGenerator = require path.join(loadPath, 'generators', 'map')

describe 'MapGenerator', ->
  [gen] = []

  before ->
    gen = new MapGenerator('agdrily')

  it 'should have a seed', ->
    # This test is mainly to make sure than seed random works how I expect

    expect(gen.seed).to.equal 'agdrily'
    expect(gen.rngseed).to.equal 'rily'
    expect(gen.rng.int32()).to.equal -1269640076
    expect(gen.rng.int32()).to.equal -1817341562
    expect(gen.rng.int32()).to.equal 442141495

  it 'should have an empty flat area in the middle', ->
    expect(gen.map.count()).to.equal 36
    origin = gen.map.findOne({x: 0}, {y: 0})
    expect(origin.levels[0]).to.equal 0
    expect(origin.levels[1]).to.equal 0
    expect(origin.levels[2]).to.equal 0
    expect(origin.levels[3]).to.equal 0
    expect(origin.levels[4]).to.equal 1
    expect(origin.levels[5]).to.equal 1
    expect(origin.levels[6]).to.equal 1
    expect(origin.levels[7]).to.equal 1
    expect(origin.levels[8]).to.equal 1
    expect(origin.levels[9]).to.equal 1
    expect(origin.levels[10]).to.equal 1
    expect(origin.levels[11]).to.equal 1
    expect(origin.levels[12]).to.equal 1
    expect(origin.levels[13]).to.equal 1
    expect(origin.levels[14]).to.equal 0
    expect(origin.levels[15]).to.equal 0
    expect(origin.levels[16]).to.equal 0
    expect(origin.levels[17]).to.equal 0
    expect(origin.levels[18]).to.equal 0
    expect(origin.levels[19]).to.equal 0
