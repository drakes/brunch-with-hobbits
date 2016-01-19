module.exports =
	class BaseModel
		constructor: ({pubSub}) ->
			@_pubSub = pubSub
			# override should define as- 'topic': @_handlerMethod
			@_pubSubHandlers = {}

		connectHandlers: =>
			@_pubSub.subscribe topic, handler for topic, handler of @_pubSubHandlers

		disconnectHandlers: =>
			@_pubSub.unsubscribe topic, handler for topic, handler of @_pubSubHandlers
