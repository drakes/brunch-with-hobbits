ToDosModel = require 'models/to-dos'

mockPubSub = require '../mocks/pub-sub'

describe 'ToDosModel', ->
	toDosModel = null

	describe 'with no items', ->
		beforeEach ->
			toDosModel = new ToDosModel items: [], pubSub: mockPubSub
			toDosModel.connectHandlers()

		afterEach ->
			toDosModel.disconnectHandlers()

		it 'has zero items', ->
			items = toDosModel.all()
			expect(items).to.be.empty

	describe 'with some items', ->
		itemData = [
			'build something awesome'
			'???'
			'profit'
		]

		# set up preconditions in `beforeEach`
		beforeEach ->
			toDosModel = new ToDosModel items: itemData, pubSub: mockPubSub
			toDosModel.connectHandlers()

		afterEach ->
			toDosModel.disconnectHandlers()

		# leaving only assertions and querying methods for values in `it` blocks
		# ideally a single assertion per `it`
		it 'has the correct number of items', ->
			items = toDosModel.all()
			expect(items).to.have.length itemData.length

		it 'provides an item\'s "done" state', ->
			firstItem = toDosModel.all()[0]
			firstKey = firstItem.key
			isDone = toDosModel.isItemDone key: firstKey
			expect(isDone).to.be.false

		it 'provides an item\'s text', ->
			firstItem = toDosModel.all()[0]
			firstKey = firstItem.key
			text = toDosModel.textOf key: firstKey
			expect(text).to.equal itemData[0]

		describe 'adding an item', ->
			newItemText = 'read ALL the books'

			beforeEach ->
				mockPubSub.publish 'toDos:add', text: newItemText

			it 'has the new item', ->
				items = toDosModel.all()
				newItemPresent = yes for item in items when item.text is newItemText
				expect(newItemPresent).to.be.true

			it 'has an additional item', ->
				items = toDosModel.all()
				expect(items).to.have.length itemData.length + 1

		describe 'trying to add an empty item', ->
			beforeEach ->
				mockPubSub.publish 'toDos:add', text: ''

			it 'has the original number of items', ->
				items = toDosModel.all()
				expect(items).to.have.length itemData.length

		describe 'trying to add whitespace as an item', ->
			beforeEach ->
				mockPubSub.publish 'toDos:add', text: ' '

			it 'has the original number of items', ->
				items = toDosModel.all()
				expect(items).to.have.length itemData.length
