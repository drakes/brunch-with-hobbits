# Brunch with Hobbits
An app skeleton for [Brunch](http://brunch.io/).

## Overview
Brunch builds your app (compiles and concatenates scripts, etc.) and is fast at doing it.
Brunch with Hobbits seeds your app structure, including a great JavaScript framework: Mithril. It also provides a tiny example app to illustrate how things are hooked together, including tests.

## Features
* [Mithril](http://lhorie.github.io/mithril/)
* [CoffeeScript](http://coffeescript.org/), with [CoffeeLint](http://www.coffeelint.org/)
* [Stylus](http://learnboost.github.io/stylus/)
* [Styledocco](http://jacobrask.github.io/styledocco/)
* Automated tests, with notifications, using:
  * [Mocha](http://mochajs.org/)
  * [Chai](http://chaijs.com/)
  * [Sinon](http://sinonjs.org/)
  * [PhantomJS](http://phantomjs.org/)

## Applications
Brunch with Hobbits hooks up a bunch of useful tools and provides opinionated defaults. If these choices work for you you'll find it an excellent starting point for building:
* Stand-alone single-page applications
* The frontend to go with any type of backend web application/server (Express, Rails, Django, ASP.NET, etc.; consider build steps to invoke `brunch build --production` and copy the contents of public/ to the appropriate assets directory)
* Web views for cross-platform mobile apps (with Cordova, Xamarin, etc.)

## Getting started
### Requirements
* [node](https://nodejs.org/)

Install dependencies:

```
npm install -g brunch
```

### Create a project with this skeleton

```
brunch new [optional-output-dir] -s gh:drakes/brunch-with-hobbits
```

#### Optionally uninstall Brunch global

The `brunch` global is only required to start a new project; from that point forward everything to build and use the project is installed locally in that project's directories. You may optionally uninstall global brunch afterward:

```
npm uninstall -g brunch
```

### Build, run tests, and launch a server

```
npm start
```

Editing changes should be picked up by brunch automatically in "watch" mode and recompiled, etc., including re-running tests on script changes.

To view the app browse to: http://localhost:3333/

To stop the server: ctrl+c

## License
Brunch with Hobbits is � [Scott Drake](http://3dmdesign.com) and available under the [MIT license](http://opensource.org/licenses/MIT).
