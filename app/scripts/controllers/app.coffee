AppModel = require 'models/app'

module.exports =
	class AppController
		constructor: ->
			@vm = new AppModel
