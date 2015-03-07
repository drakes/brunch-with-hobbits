ToDoModel = require 'models/todo'

describe 'ToDoModel', ->
	toDo = null
	content = 'build something awesome'

	# set up preconditions in `beforeEach`
	beforeEach ->
		toDo = new ToDoModel content

	# leaving only assertions
	# and querying methods for values
	# in `it` blocks
	# ideally a single assertion per `it`
	it 'has the content', ->
		expect(toDo.content()).to.equal content

	it 'is not done', ->
		expect(toDo.done()).to.equal no

	# describe blocks can be nested
	# with their own description and `beforeEach` block
	# which helps build on previous setup with additional steps
	# that apply only to the nested tests
	describe 'marked done', ->
		beforeEach ->
			toDo.done yes

		it 'is done', ->
			expect(toDo.done()).to.equal yes

	describe 'editing content', ->
		editedContent = 'build something'

		beforeEach ->
			toDo.content editedContent

		it 'has the new content', ->
			expect(toDo.content()).to.equal editedContent
