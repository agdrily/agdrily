coffeeScript = require('coffee-script');
coffeeScript.register();

app = require('./src/express-app/app')

app.listen(3000)
