m = require 'mithril'

ToDo = require 'controllers/to-do'

module.exports =
	toDoListView = (vnode) ->
		toDoList = vnode.state
		data = toDoList.data()

		m 'div', [
			m 'ul', (m ToDo, {key, data} for key in toDoList.itemKeys())
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
