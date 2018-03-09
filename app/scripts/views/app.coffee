m = require 'mithril'

ToDoList = require 'controllers/to-do-list'

module.exports =
	appView = (vnode) ->
		app = vnode.state

		# provide custom data as a `data` property
		# avoiding potential collisions with Mithril's lifecycle methods, etc. on vnode.attrs
		m ToDoList, data: app.data()
