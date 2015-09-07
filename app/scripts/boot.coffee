m = window.m
docReady = window.docReady
pubSub = window.amplify

AppController = require 'controllers/app'
appView = require 'views/app'

modelClasses =
	toDos: require 'models/to-dos'

instantiateModels = ->
	models = {}
	for type, Model of modelClasses
		model = new Model pubSub: pubSub
		model.connectHandlers()
		models[type] = model
	models

docReady ->
	models = instantiateModels()
	# models are passed down to permit easy querying
	# but receive "commands" only through action events, not method calls
	appController = new AppController models: models, pubSub: pubSub
	App =
		controller: -> appController
		view: appView

	body = document.getElementsByTagName('body')[0]
	m.mount body, App
