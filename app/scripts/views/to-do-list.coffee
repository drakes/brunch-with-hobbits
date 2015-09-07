m = window.m

wrapConstructor = require 'wrap-constructor'

ToDo =
	controller: require 'controllers/to-do'
	view: require 'views/to-do'
ToDo.controller = wrapConstructor ToDo.controller

module.exports =
	toDoListView = (toDoList, commonArgs) ->
		m 'div', [
			m 'ul', (m.component ToDo, toDo, commonArgs for toDo in toDoList.items())
			m 'p', [
				m 'input',
				{
					onchange: m.withAttr 'value', toDoList.input
					onkeypress: toDoList.keyPressed
					value: toDoList.input()
				}
				m 'button', {onclick: toDoList.addItem}, 'Add'
			]
		]
