pubSub = window.amplify

appView = require 'views/app'

modelClasses =
	toDos: require 'models/to-dos'

module.exports =
	class App
		constructor: (vnode) ->
			# vnode.state currently undefined

		oninit: (vnode) =>
			@_models = @_instantiateModels()

		view: appView

		data: =>
			models: @_models
			pubSub: pubSub

		_instantiateModels: ->
			# models are passed down to permit easy querying
			# but receive "commands" only through action events, not method calls
			models = {}
			for type, Model of modelClasses
				model = new Model {pubSub}
				model.connectHandlers()
				models[type] = model
			models
