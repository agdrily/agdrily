(function() {
  var Express, router;

  Express = require('express');

  router = Express.Router();

  router.get('/', function(req, res) {
    return res.render('base/index');
  });

  module.exports = router;

}).call(this);
