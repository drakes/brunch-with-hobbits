ToDoListModel = require 'models/todo-list'

ENTER_KEY = 13

class ToDoListController
	constructor: (itemData) ->
		@vm = new ToDoListModel itemData

	keyPressed: (event) =>
		@vm.input event.target.value
		# browser compatibility
		key = event.which or event.keyCode or event.charCode
		@vm.addItem() if key is ENTER_KEY

module.exports = ToDoListController
