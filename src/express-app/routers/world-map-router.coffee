Express = require 'express'
path = require 'path'
router = Express.Router()
WorldMapViewer = require '../../viewers/world-map-viewer'

router.get '/', (req, res) ->
  res.render 'world_map/show'

router.get '/draw.coffee', (req, res) ->
  res.sendFile(path.join(__dirname, '..', '..', 'client', 'world_map', 'draw.coffee'))

module.exports = router
