# Brunch with Hobbits
An app skeleton for [Brunch](http://brunch.io/).

## Overview
Brunch builds your app (compiles and concatenates scripts, etc.) and is fast at doing it.
Brunch with Hobbits seeds your app structure, including a great JavaScript framework: Mithril. It also provides a tiny example app to illustrate how things are hooked together, including tests.

## Features
* [Mithril](http://lhorie.github.io/mithril/)
* [CoffeeScript](http://coffeescript.org/)
* [Stylus](http://learnboost.github.io/stylus/)
* Automated tests, with notifications, using:
  * [Mocha](http://mochajs.org/)
  * [Chai](http://chaijs.com/)
  * [Sinon](http://sinonjs.org/)
  * [Mocha-PhantomJS](https://github.com/metaskills/mocha-phantomjs)

## Getting started
### Requirements
* [node](https://nodejs.org/)
* [brunch](http://brunch.io/)
* [bower](http://bower.io/)

Additionally, mocha-phantomjs and phantomjs should be installed globally to make their executables available (for automated testing on changes):

```
npm install -g mocha-phantomjs phantomjs
```

### Create a project with this skeleton

```
brunch new gh:drakes/brunch-with-hobbits [optional-output-dir]
```

### Build, run tests, and launch a server

```
brunch watch --server
```

Editing changes should be picked up by brunch automatically in "watch" mode and recompiled, etc., including re-running tests on script changes.

To view the app browse to: http://localhost:3333/

## License
Brunch with Hobbits is © [Scott Drake](http://3dmdesign.com) and available under the [MIT license](http://opensource.org/licenses/MIT).
