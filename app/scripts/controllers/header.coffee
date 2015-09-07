HeaderModel = require 'models/header'

module.exports =
	class HeaderController
		constructor: ->
			@vm = new HeaderModel
