Express = require 'express'
fs = require 'fs'
fsrdr = require 'fs-readdir-recursive'
router = Express.Router()
path = require 'path'

files = fsrdr path.join(__dirname, '..', '..', '..', 'docs')
files = files.map (x) ->
  "/#{x.replace(/\\/, '/')}"

router.get '/', (req, res) ->
  res.locals.filePath = path.join(__dirname, '..', '..', '..', 'docs', 'concept.md')
  res.locals.files = files
  fs.readFile res.locals.filePath, (err, data) ->
    res.locals.fileData = data.toString()
    res.render 'docs/show'

for file in files
  router.get file, (req, res) ->
    res.locals.filePath = path.join(__dirname, '..', '..', '..', req.originalUrl)
    res.locals.files = files
    fs.readFile res.locals.filePath, (err, data) ->
      res.locals.fileData = data.toString()
      res.render 'docs/show'

module.exports = router
