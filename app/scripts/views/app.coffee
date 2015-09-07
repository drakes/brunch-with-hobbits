m = window.m

module.exports =
	appView = (app) ->
		m 'div', (m.component component for component in app.vm.components())
