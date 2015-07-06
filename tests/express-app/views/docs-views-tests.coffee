expect = require('chai').expect
path = require 'path'
request = require 'supertest'

app = require path.join(loadPath, 'express-app', 'app')

describe 'docs/show', ->
  it 'should render concept for the index', (done) ->
    request(app)
      .get('/docs')
      .expect(/<h1>Concept<\/h1>/, done)

  it 'should add a route for all the docs', (done) ->
    request(app)
      .get('/docs/generators/map.md')
      .expect(200, done)
