ToDoListModel = require 'models/todo-list'

describe 'ToDoListModel', ->
	toDoList = null

	describe 'with no items', ->
		beforeEach ->
			toDoList = new ToDoListModel []

		it 'has zero items', ->
			items = toDoList.items()
			expect(items).to.be.empty

	describe 'with some items', ->
		itemData = [
			'build something awesome'
			'???'
			'profit'
		]

		# set up preconditions in `beforeEach`
		beforeEach ->
			toDoList = new ToDoListModel itemData

		# leaving only assertions
		# and querying methods for values
		# in `it` blocks
		# ideally a single assertion per `it`
		it 'has the correct number of items', ->
			items = toDoList.items()
			expect(items).to.have.length itemData.length

		it 'has empty input', ->
			expect(toDoList.input()).to.be.empty

		# describe blocks can be nested (to any depth)
		# with their own description and `beforeEach` block
		# which helps build on previous setup with additional steps
		# that apply only to the nested tests
		describe 'changing input', ->
			newInput = 'read ALL the books'

			beforeEach ->
				toDoList.input newInput

			it 'has the new input', ->
				expect(toDoList.input()).to.equal newInput

			describe 'adding the item', ->
				beforeEach ->
					toDoList.addItem()

				it 'has an additional item', ->
					items = toDoList.items()
					expect(items).to.have.length itemData.length + 1

				it 'empties the input', ->
					expect(toDoList.input()).to.be.empty

		describe 'trying to add an empty item', ->
			beforeEach ->
				toDoList.addItem()

			it 'has the original number of items', ->
				items = toDoList.items()
				expect(items).to.have.length itemData.length

		describe 'trying to add whitespace as an item', ->
			beforeEach ->
				toDoList.input ' '
				toDoList.addItem()

			it 'has the original number of items', ->
				items = toDoList.items()
				expect(items).to.have.length itemData.length
