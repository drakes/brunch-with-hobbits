m = require 'mithril'
classNames = require 'classnames'

module.exports =
	toDoView = (vnode) ->
		toDo = vnode.state
		done = toDo.isDone()

		m 'li', {class: classNames done: done},
			m 'label', [
				m 'input[type=checkbox]',
				{
					checked: done
					onchange: toDo.toggleDone
				}
				toDo.text()
			]
