Express = require 'express'
path = require 'path'
router = Express.Router()
WorldMapViewer = require path.join(__dirname, '..', '..', 'viewers', 'world-map-viewer')

router.apiVersion = '0'

router.get '/', (req, res) ->
  res.send JSON.stringify {
    version: router.apiVersion
  }

router.get '/api.coffee', (req, res) ->
  res.sendFile(path.join(__dirname, '..', '..', 'client', 'api.coffee'))

router.get '/world_map', (req, res) ->
  viewer = new WorldMapViewer
  res.send JSON.stringify(viewer.area(-3, -3, 2, 2))


module.exports = router
