m = require 'mithril'

module.exports =
	appView = (app, commonArgs) ->
		m 'div', (m.component component, app.commonArgs for component in app.components())
