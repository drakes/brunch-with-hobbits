m = window.m

class ToDoModel
	constructor: (content) ->
		@content = m.prop content
		@done = m.prop no

module.exports = ToDoModel
