toDoView = require 'views/to-do'

module.exports =
	class ToDo
		constructor: (vnode) ->
			# vnode.state currently undefined

		oninit: (vnode) =>
			{models, pubSub} = vnode.attrs.data
			# "dependency injection", passed in to permit mocking in tests
			@_toDos = models.toDos
			@_pubSub = pubSub

			@_key = vnode.attrs.key

		view: toDoView

		text: =>
			@_toDos.textOf key: @_key

		isDone: =>
			@_toDos.isItemDone key: @_key

		toggleDone: =>
			@_pubSub.publish 'toDos:toggle', key: @_key
