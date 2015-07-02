express = require 'express'
path = require 'path'

app = express()

# Load and Require Middleware
app.use '/assets', express.static('assets')

# Load and require routers
BaseRouter = require './routers/base-router'

app.use '/', BaseRouter

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
