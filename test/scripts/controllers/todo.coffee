ToDoController = require 'controllers/todo'

describe 'ToDoController', ->
	toDoController = null

	beforeEach ->
		toDoController = new ToDoController 'build something awesome'

	it 'has a view-model', ->
		expect(toDoController).to.have.property 'vm'
