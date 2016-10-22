m = require 'mithril'

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

		redraw: ->
			m.startComputation()
			m.endComputation()

		keyPressed: (event) =>
			# browser compatibility
			key = event.which or event.keyCode or event.charCode
			@addItem() if key is ENTER_KEY

		addItem: =>
			@_pubSub.publish 'toDos:add', text: @input()
			@input ''

		itemKeys: =>
			@_toDos.allKeys()
