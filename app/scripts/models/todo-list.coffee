m = window.m

ToDoController = require 'controllers/todo'

class ToDoListModel
	constructor: (itemData) ->
		@_items = (new ToDoController content for content in itemData)
		@input = m.prop ''

	# by convention methods and properties starting with `_` are considered private
	_inputIsValid: ->
		!!@input().match /\S/

	# we don't want `_items` to be manipulated directly
	# but provide an accessor for reading
	items: ->
		@_items

	addItem: =>
		if @_inputIsValid()
			@_items.push new ToDoController @input()
			@input ''

module.exports = ToDoListModel
