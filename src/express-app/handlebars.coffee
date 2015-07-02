ExpressHandlebars  = require 'express-handlebars'
markdown = require 'markdown'

handlebars = ExpressHandlebars.create({
  defaultLayout: 'main'
  helpers: {
    md: (string) ->
      markdown.parse(string)

    eif: (v1, v2, options) ->
      if v1 == v2
        return options.fn this

      return options.inverse this

  }
})

module.exports = handlebars
