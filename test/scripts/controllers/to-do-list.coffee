ToDoListController = require 'controllers/to-do-list'

mockPubSub = require '../mocks/pub-sub'

describe 'ToDoListController', ->
	toDoListController = null

	mockItems = ['an item']

	mockModels =
		toDos:
			allKeys: ->
				index + 1 for item, index in mockItems

	beforeEach ->
		toDoListController = new ToDoListController models: mockModels, pubSub: mockPubSub

	it 'provides item keys', ->
		keys = toDoListController.itemKeys()
		expect(keys).to.be.an.instanceof Array
		expect(keys).to.have.length mockItems.length
