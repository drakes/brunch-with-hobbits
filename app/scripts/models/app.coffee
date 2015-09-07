ToDoListController = require 'controllers/todo-list'
toDoListView = require 'views/todo-list'

initialListItems = [
	'Write tests'
	'See tests fail'
	'Implement features'
	'See tests pass'
	'Yay!'
]

ToDoList =
	controller: ->
		new ToDoListController initialListItems: initialListItems
	view: toDoListView

Header =
	controller: require 'controllers/header'
	view: require 'views/headerView'

Footer =
	controller: require 'controllers/footer'
	view: require 'views/footer'

module.exports =
	class AppModel
		constructor: ->
			# order matters for layout
			orderedComponents = [
				Header
				ToDoList
				Footer
			]
			# layout unaffected by ordering (e.g. absolute positioning)
			orderIndependentComponents = []
			@_components = orderedComponents.concat orderIndependentComponents

		components: =>
			@_components
