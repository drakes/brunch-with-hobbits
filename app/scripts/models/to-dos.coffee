BaseModel = require 'models/base'

module.exports =
	class ToDosModel extends BaseModel
		constructor: ({items, pubSub}) ->
			super pubSub: pubSub
			@_pubSubHandlers =
				'toDos:add': @addItem
				'toDos:toggle': @toggleItem

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

		addItem: ({text}) =>
			if @_isValid text
				@_addItem text

		toggleItem: ({key}) =>
			item = @_findItem key
			item.done = not item.done

		allKeys: =>
			item.key for item in @_toDos

		isItemDone: ({key}) =>
			item = @_findItem key
			item.done

		textOf: ({key}) =>
			item = @_findItem key
			item.text

		_addItem: (text) =>
			@_toDos.push
				key: @_currentKey++
				done: no
				text: text

		_isValid: (text) ->
			!!text.match /\S/

		_findItem: (key) =>
			return item for item in @_toDos when item.key is key

