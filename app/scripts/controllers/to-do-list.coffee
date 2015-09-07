m = window.m

ENTER_KEY = 13

module.exports =
	class ToDoListController
		constructor: ({models, pubSub}) ->
			@_toDos = models.toDos
			@_pubSub = pubSub
			# view state
			@input = m.prop ''
			@_connectHandlers()

		_connectHandlers: =>
			@_pubSub.subscribe 'modelUpdated:toDos', @redraw

		redraw: =>
			m.startComputation()
			m.endComputation()

		keyPressed: (event) =>
			text = event.target.value
			# browser compatibility
			key = event.which or event.keyCode or event.charCode
			@_pubSub 'toDos:add', text: text if key is ENTER_KEY
			@input ''

		addItem: =>
			@_pubSub 'toDos:add', text: @input()
			@input ''

		items: =>
			@_toDos.all()
