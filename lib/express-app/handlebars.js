(function() {
  var ExpressHandlebars, handlebars, markdown;

  ExpressHandlebars = require('express-handlebars');

  markdown = require('markdown').markdown;

  handlebars = ExpressHandlebars.create({
    defaultLayout: 'main',
    helpers: {
      md: function(string) {
        return markdown.toHTML(string);
      },
      eif: function(v1, v2, options) {
        if (v1 === v2) {
          return options.fn(this);
        }
        return options.inverse(this);
      }
    }
  });

  module.exports = handlebars;

}).call(this);
