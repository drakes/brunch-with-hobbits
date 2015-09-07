m = window.m

module.exports =
	appView = (app, commonArgs) ->
		m 'div', (m.component component, commonArgs for component in app.components())
