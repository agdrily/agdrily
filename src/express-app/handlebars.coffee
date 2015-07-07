ExpressHandlebars  = require 'express-handlebars'
markdown = require('markdown').markdown

handlebars = ExpressHandlebars.create({
  # Set the default layout to main
  defaultLayout: 'main'

  # Add some helpers
  helpers: {
    # Parse the supplied string as markdown, best used as {{{md string}}}
    md: (string) ->
      markdown.toHTML(string)

    eif: (v1, v2, options) ->
      if v1 == v2
        return options.fn this

      return options.inverse this

  }
})

module.exports = handlebars
