# Require Express and path
express = require 'express'
path = require 'path'

# Create the app
app = express()

# Load and Require Middleware
app.use '/assets', express.static('assets')
app.use '/codo', express.static('codo')

# Load and require routers
BaseRouter = require './routers/base-router'
DocsRouter = require './routers/docs-router'

app.use '/', BaseRouter
app.use '/docs', DocsRouter

# Load the custom handlebars module from /src/express-app/handlebars.coffee and set it up as the view engine.
Handlebars = require './handlebars'
app.engine 'handlebars', Handlebars.engine
app.set 'view engine', 'handlebars'
app.set 'views', path.join(__dirname, '..', '..', 'views')

# Default locals
app.locals = {
  title: 'agdrily'
}

# Export the app
module.exports = app
