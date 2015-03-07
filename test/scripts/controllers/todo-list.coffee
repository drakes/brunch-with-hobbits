ToDoListController = require 'controllers/todo-list'

describe 'ToDoListController', ->
	toDoListController = null

	beforeEach ->
		toDoListController = new ToDoListController ['be excellent']

	it 'has a view-model', ->
		expect(toDoListController).to.have.property 'vm'
