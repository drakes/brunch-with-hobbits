ToDoList =
	controller: require 'controllers/to-do-list'
	view: require 'views/to-do-list'

module.exports =
	class AppController
		constructor: (@commonArgs) ->
			# order can matter for layout
			firstComponents = []
			# layout unaffected by ordering (e.g. flexbox, absolute positioning)
			orderIndependentComponents = [
				ToDoList
			]
			lastComponents = []
			orderedComponents = firstComponents.concat orderIndependentComponents, lastComponents
			@_components = orderedComponents

		components: =>
			@_components
