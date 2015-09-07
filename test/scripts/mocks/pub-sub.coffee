pubSub = window.amplify

mockPrefix = 'testing-'

module.exports =
	pubSubMock =
		publish: (topic, args...) ->
			pubSub.publish.apply pubSub, ["#{mockPrefix}#{topic}"].concat args

		subscribe: (topic, args...) ->
			pubSub.subscribe.apply pubSub, ["#{mockPrefix}#{topic}"].concat args

		unsubscribe: (topic, args...) ->
			pubSub.unsubscribe.apply pubSub, ["#{mockPrefix}#{topic}"].concat args
