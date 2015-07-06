(function() {
  var Express, file, files, fs, fsrdr, i, len, path, router;

  Express = require('express');

  fs = require('fs');

  fsrdr = require('fs-readdir-recursive');

  router = Express.Router();

  path = require('path');

  files = fsrdr(path.join(__dirname, '..', '..', '..', 'docs'));

  files = files.map(function(x) {
    return "/" + (x.replace(/\\/, '/'));
  });

  router.get('/', function(req, res) {
    res.locals.filePath = path.join(__dirname, '..', '..', '..', 'docs', 'concept.md');
    res.locals.files = files;
    return fs.readFile(res.locals.filePath, function(err, data) {
      res.locals.fileData = data.toString();
      return res.render('docs/show');
    });
  });

  for (i = 0, len = files.length; i < len; i++) {
    file = files[i];
    router.get(file, function(req, res) {
      res.locals.filePath = path.join(__dirname, '..', '..', '..', req.originalUrl);
      res.locals.files = files;
      return fs.readFile(res.locals.filePath, function(err, data) {
        res.locals.fileData = data.toString();
        return res.render('docs/show');
      });
    });
  }

  module.exports = router;

}).call(this);
