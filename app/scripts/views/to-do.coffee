m = require 'mithril'
classNames = require 'classnames'

module.exports =
	toDoView = (toDo) ->
		m 'li', {class: classNames done: toDo.isDone()},
			m 'label', [
				m 'input[type=checkbox]',
				{
					checked: toDo.isDone()
					onchange: m.withAttr 'checked', toDo.toggleDone
				}
				toDo.text()
			]
