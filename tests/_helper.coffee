path = require 'path'
phantom = require 'phantom'

global.loadPath = path.join(__dirname, '..', 'src')
global.port = 3333
global.runPhantom = (cb) ->
  phantom.create (ph) ->
    cb(ph)
  , { dnodeOpts: { weak: false }}


app = require path.join(__dirname, '..', 'src', 'express-app', 'app')

before (done) ->
  app.listen port, ->
    done()
