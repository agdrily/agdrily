express = require 'express'
path = require 'path'

app = express()

# Load and Require Middleware
app.use '/assets', express.static('assets')

# Load and require routers
BaseRouter = require './routers/base-router'
DocsRouter = require './routers/docs-router'

app.use '/', BaseRouter
app.use '/docs', DocsRouter

# Load handlebars
Handlebars = require './handlebars'
app.engine 'handlebars', Handlebars.engine
app.set 'view engine', 'handlebars'
app.set 'views', path.join(__dirname, '..', '..', 'views')

# Default locals
app.locals = {
  title: 'agdrily'
}

module.exports = app
