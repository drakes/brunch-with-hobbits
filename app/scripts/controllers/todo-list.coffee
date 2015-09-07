ToDoListModel = require 'models/todo-list'

ENTER_KEY = 13

module.exports =
	class ToDoListController
		constructor: ({initialListItems}) ->
			@vm = new ToDoListModel initialListItems

		keyPressed: (event) =>
			@vm.input event.target.value
			# browser compatibility
			key = event.which or event.keyCode or event.charCode
			@vm.addItem() if key is ENTER_KEY
