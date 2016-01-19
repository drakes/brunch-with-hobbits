m = window.m

wrapConstructor = require 'wrap-constructor'

ToDo =
	controller: require 'controllers/to-do'
	view: require 'views/to-do'
ToDo.controller = wrapConstructor ToDo.controller

module.exports =
	toDoListView = (toDoList, commonArgs) ->
		m 'div', [
			m 'ul', (m.component ToDo, key: key, commonArgs for key in toDoList.itemKeys())
			m 'p', [
				m 'input',
				{
					oninput: m.withAttr 'value', toDoList.input
					onkeypress: toDoList.keyPressed
					value: toDoList.input()
				}
				m 'button', {onclick: toDoList.addItem}, 'Add'
			]
		]
