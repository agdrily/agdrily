Express = require 'express'
router = Express.Router()

router.get '/', (req, res) ->
  res.render 'base/index'

module.exports = router
