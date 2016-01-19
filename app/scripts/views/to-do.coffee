m = window.m

module.exports =
	toDoView = (toDo) ->
		m 'li', {class: if toDo.isDone() then 'done' else ''},
			m 'label', [
				m 'input[type=checkbox]',
				{
					checked: toDo.isDone()
					onchange: m.withAttr 'checked', toDo.toggleDone
				}
				toDo.text()
			]
