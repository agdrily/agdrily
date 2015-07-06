require('coffee-coverage').register({
  instrumentor: 'jscoverage',
  basePath: process.cwd(),
  path: 'relative',
  exclude: ['/tests', '/node_modules', '/.git', 'Gruntfile.coffee', '/support'],
  coverageVar: '_$jscoverage',
  initAll: true
});

require('coffee-script/register');
