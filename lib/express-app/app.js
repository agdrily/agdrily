(function() {
  var BaseRouter, DocsRouter, Handlebars, app, express, path;

  express = require('express');

  path = require('path');

  app = express();

  app.use('/assets', express["static"]('assets'));

  BaseRouter = require('./routers/base-router');

  DocsRouter = require('./routers/docs-router');

  app.use('/', BaseRouter);

  app.use('/docs', DocsRouter);

  Handlebars = require('./handlebars');

  app.engine('handlebars', Handlebars.engine);

  app.set('view engine', 'handlebars');

  app.set('views', path.join(__dirname, '..', '..', 'views'));

  app.locals = {
    title: 'agdrily'
  };

  module.exports = app;

}).call(this);
