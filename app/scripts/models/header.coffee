m = window.m

# all of this is probably a bit much
# static text and markup could reside entirely in the view
# and not really need a model or controller
#
# it doesn't need Mithril either
# and could be directly in the HTML
# but this does demonstrate an App with multiple components
# using Mithril all the way down
module.exports =
	class HeaderModel
		constructor: ->
			@homeUrl = m.prop 'https://github.com/drakes/brunch-with-hobbits'
			@name = m.prop 'Brunch with Hobbits'
			@lead = m.prop [
				'An app skeleton for '
				{href: 'http://brunch.io/', text: 'Brunch'}
				', featuring:'
			]
			@featuredItems = m.prop [
				[{href: 'http://lhorie.github.io/mithril/', text: 'Mithril'}]
				[
					{href: 'http://coffeescript.org/', text: 'CoffeeScript'}
					', with '
					{href: 'http://www.coffeelint.org/', text: 'CoffeeLint'}
				]
				[{href: 'http://learnboost.github.io/stylus/', text: 'Stylus'}]
				[
					'Automated '
					{href: '/test', text: 'tests'}
					', with notifications, using '
					{href: 'http://mochajs.org/', text: 'Mocha'}
					', '
					{href: 'http://chaijs.com/', text: 'Chai'}
					', '
					{href: 'http://sinonjs.org/', text: 'Sinon'}
					', and '
					{href: 'https://github.com/metaskills/mocha-phantomjs', text: 'Mocha-PhantomJS'}
				]
				[
					{href: 'http://jacobrask.github.io/styledocco/', text: 'Styledocco'}
					'-generated '
					{href: '/style-guide', text: 'style guide'}
				]
			]
			@subHead = m.prop 'To-do example app'
