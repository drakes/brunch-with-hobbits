toDoListView = require 'views/to-do-list'

ENTER_KEY = 13

module.exports =
	class ToDoList
		constructor: (vnode) ->
			# vnode.state currently undefined

		oninit: (vnode) =>
			{models, pubSub} = vnode.attrs.data
			# "dependency injection", passed in to permit mocking in tests
			@_models = models
			@_toDos = models.toDos
			@_pubSub = pubSub

			# view state (more transitory than model state)
			@_input = ''

		view: toDoListView

		data: =>
			models: @_models
			pubSub: @_pubSub

		input: (value) =>
			return @_input if value is undefined

			@_input = value

		keyPressed: (event) =>
			# browser compatibility
			key = event.which or event.keyCode or event.charCode
			@addItem() if key is ENTER_KEY

		addItem: =>
			@_pubSub.publish 'toDos:add', text: @input()
			@input ''

		itemKeys: =>
			@_toDos.allKeys()
