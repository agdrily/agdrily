coffeeScript = require('coffee-script');
coffeeScript.register();

app = require('./src/express-app/app')

app.listen((process.env.PORT || 3000))
