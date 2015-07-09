Express = require 'express'
router = Express.Router()
WorldMapViewer = require '../../viewers/world-map-viewer'

router.get '/', (req, res) ->
  res.render 'world_map/show'

router.get '/draw.coffee', (req, res) ->
  res.send ''

module.exports = router
