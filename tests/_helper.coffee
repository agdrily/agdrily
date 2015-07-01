path = require 'path'

if /lib-cov/.test(__dirname)
  global.loadPath = path.join(__dirname, '..')
else
  global.loadPath = path.join(__dirname, '..', 'lib')
