ToDoListController = require 'controllers/todo-list'

describe 'ToDoListController', ->
	toDoListController = null

	beforeEach ->
		toDoListController = new ToDoListController initialListItems: ['be excellent']

	it 'has a view-model', ->
		expect(toDoListController).to.have.property 'vm'
