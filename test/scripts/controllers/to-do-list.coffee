ToDoListController = require 'controllers/to-do-list'

mockPubSub = require '../mocks/pub-sub'

describe 'ToDoListController', ->
	toDoListController = null

	mockModels =
		toDos:
			all: ->
				['an item']

	beforeEach ->
		toDoListController = new ToDoListController models: mockModels, pubSub: mockPubSub

	it 'provides to-do items', ->
		items = toDoListController.items()
		expect(items).to.be.an.instanceof Array
		expect(items).not.to.be.empty
