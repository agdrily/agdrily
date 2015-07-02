(function() {
  var BaseRouter, Handlebars, app, express, path;

  express = require('express');

  path = require('path');

  app = express();

  app.use('/assets', express["static"]('assets'));

  BaseRouter = require('./routers/base-router');

  app.use('/', BaseRouter);

  Handlebars = require('./handlebars');

  app.engine('handlebars', Handlebars.engine);

  app.set('view engine', 'handlebars');

  app.set('views', path.join(__dirname, '..', '..', 'views'));

  app.locals = {
    title: 'agdrily'
  };

  module.exports = app;

}).call(this);
