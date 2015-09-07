ToDoList =
	controller: require 'controllers/to-do-list'
	view: require 'views/to-do-list'

Header =
	controller: require 'controllers/header'
	view: require 'views/headerView'

Footer =
	controller: require 'controllers/footer'
	view: require 'views/footer'

module.exports =
	class AppController
		constructor: ->
			# order matters for layout
			orderedComponents = [
				Header
				ToDoList
				Footer
			]
			# layout unaffected by ordering (e.g. flexbox, absolute positioning)
			orderIndependentComponents = []
			@_components = orderedComponents.concat orderIndependentComponents

		components: =>
			@_components
