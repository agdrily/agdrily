# Require Express and path
express = require 'express'
fs = require 'fs'
path = require 'path'

# Create the app
app = express()

# Load and Require Middleware
app.use '/assets', express.static('assets')
app.use '/codo', express.static('codo')

# Load and require routers
ApiRouter = require './routers/api-router'
BaseRouter = require './routers/base-router'
DocsRouter = require './routers/docs-router'
WorldMapRouter = require './routers/world-map-router'

app.use '/', BaseRouter
app.use "/api/#{ApiRouter.apiVersion}", ApiRouter
app.use '/docs', DocsRouter
app.use '/world_map', WorldMapRouter

# Load the custom handlebars module from /src/express-app/handlebars.coffee and set it up as the view engine.
Handlebars = require './handlebars'
app.engine 'handlebars', Handlebars.engine
app.set 'view engine', 'handlebars'
app.set 'views', path.join(__dirname, '..', '..', 'views')

# Default locals
app.locals = {
  title: 'agdrily'
  docs: {}
}

fs.readFile path.join(__dirname, '..', '..', 'docs', 'index.md'), (err, data) ->
  app.locals.docs.index = data.toString()

# Export the app
module.exports = app
