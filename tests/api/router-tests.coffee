expect = require('chai').expect
path = require 'path'
request = require 'supertest'

app = require path.join(loadPath, 'express-app', 'app')

describe 'api', ->
  it 'should have a version number', (done) ->
    request(app)
      .get('/api/0')
      .expect (res) ->
        json = JSON.parse res.text
        return !(json.version == 0)
      .end(done)
