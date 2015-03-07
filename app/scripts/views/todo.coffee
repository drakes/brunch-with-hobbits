m = window.m

toDoView = (toDo) ->
	m 'li', {class: if toDo.vm.done() then 'done' else ''}, [
		m 'input[type=checkbox]',
		{
			checked: toDo.vm.done()
			onchange: m.withAttr 'checked', toDo.vm.done
		}
		toDo.vm.content()
	]

module.exports = toDoView
