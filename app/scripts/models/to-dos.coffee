module.exports =
	class ToDosModel
		constructor: ({items, pubSub}) ->
			@_pubSub = pubSub
			@_currentKey = 1
			initialListItems = items or [
				'Write tests'
				'See tests fail'
				'Implement features'
				'See tests pass'
				'Yay!'
			]
			@_toDos = []
			@_addItem item for item in initialListItems

		_addItem: (text) =>
			@_toDos.push
				key: @_currentKey++
				done: no
				text: text

		_isValid: (text) =>
			!!text.match /\S/

		_findItem: (key) =>
			return item for item in @_toDos when item.key is key

		connectHandlers: =>
			@_pubSub.subscribe 'toDos:add', @addItem
			@_pubSub.subscribe 'toDos:toggle', @toggleItem

		disconnectHandlers: =>
			@_pubSub.unsubscribe 'toDos:add', @addItem
			@_pubSub.unsubscribe 'toDos:toggle', @toggleItem

		addItem: ({text}) =>
			if @_isValid text
				@_addItem text
				@_pubSub.publish 'modelUpdated:toDos'

		toggleItem: ({key}) =>
			item = @_findItem key
			item.done = not item.done
			@_pubSub.publish 'modelUpdated:toDos'

		all: =>
			@_toDos

		isItemDone: ({key}) =>
			item = @_findItem key
			item.done

		textOf: ({key}) =>
			item = @_findItem key
			item.text
