m = window.m

toDoView = require 'views/todo'

toDoListView = (toDoList) ->
	m 'div', [
		m 'ul', (toDoView toDo for toDo in toDoList.vm.items())
		m 'p', [
			m 'input',
			{
				onchange: m.withAttr 'value', toDoList.vm.input
				onkeypress: toDoList.keyPressed
				value: toDoList.vm.input()
			}
			m 'button', {onclick: toDoList.vm.addItem}, 'Add'
		]
	]

module.exports = toDoListView
