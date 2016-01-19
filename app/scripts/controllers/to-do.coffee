module.exports =
	class ToDoController
		constructor: ({key}, {models, pubSub}) ->
			@_toDos = models.toDos
			@_pubSub = pubSub
			@_key = key

		text: =>
			@_toDos.textOf key: @_key

		isDone: =>
			@_toDos.isItemDone key: @_key

		toggleDone: (done) =>
			@_pubSub.publish 'toDos:toggle', key: @_key
