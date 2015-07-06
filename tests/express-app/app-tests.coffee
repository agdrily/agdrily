expect = require('chai').expect
path = require 'path'
request = require 'supertest'

app = require path.join(loadPath, 'express-app', 'app')

describe 'express-app', ->
  it 'should respond to /', (done) ->
    request(app)
      .get('/')
      .expect(200, done)

  it 'should parse handlebars', (done) ->
    request(app)
      .get('/')
      .expect(/<title>agdrily<\/title>/, done)
