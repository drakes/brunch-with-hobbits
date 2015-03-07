ToDoModel = require 'models/todo'

class ToDoController
	constructor: (content) ->
		@vm = new ToDoModel content

module.exports = ToDoController
