# agdrily

[![Join the chat at https://gitter.im/agdrily/agdrily](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/agdrily/agdrily?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/agdrily/agdrily.svg?branch=master)](https://travis-ci.org/agdrily/agdrily) [![Coverage Status](https://coveralls.io/repos/agdrily/agdrily/badge.svg)](https://coveralls.io/r/agdrily/agdrily) [![Dependency Status](https://david-dm.org/agdrily/agdrily.svg)](https://david-dm.org/agdrily/agdrily) [![devDependency Status](https://david-dm.org/agdrily/agdrily/dev-status.svg)](https://david-dm.org/agdrily/agdrily#info=devDependencies)

## Development

The aim with agdrily is to _crowd-develop_ a game. To do this we are going to use [github flow](https://guides.github.com/introduction/flow/) which does mean that anyone wishing to help out will need to have a github account.

Following github flow everything in the master branch should be deployable and is infact auto deployed to heroku as soon as the CI tests pass. As such if you notice anything weird on the site the cause will be somewhere in this repository.

Everything agdrily related will be put into this repository, the [docs](/docs) folder contains all the game design documents and the code documentation

### Building

To build agdrily on your machine clone the repository and then run `grunt install` this will run everything you need to get agdrily running on your machine.

Once installed `grunt test` will run the tests and `grunt launch` will host the express app on port 3000.

### What needs to be a in a PR

 - __Tests__ we rely on tests to make sure that the app is safe to deploy. Ideally you would add a test to:
  - confirm a bug which should fail to begin with then be fixed by your improvements. (and should remain to prevent it happening again)
  - test any new code. These should appear before your code.
  - _If your PR is just to update docs or assets don't worry there isn't anything to test_
 - __your changes__ kind of obvious really.
 - __Documentation__ this is a must.
