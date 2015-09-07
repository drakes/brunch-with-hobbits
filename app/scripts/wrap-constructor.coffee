# m.component, in 0.2.0, calls controller.apply
# changing the context of a bare component.controller
# this is a workaround
# based on: http://stackoverflow.com/a/1608546
#
# for a `class Thing` or similar
# should provide the same results when called in either of these styles:
#
# Constructor = wrapConstructor Thing
# t1 = new Constructor 'a'
# t2 = Constructor.call @, 'a'

module.exports =
	wrapConstructor = (constructor) ->
		# coffeeLint: disable=missing_fat_arrows
		C - (args) ->
			constructor.apply @, args
		# coffeelint: enable=missing_fat_arrows

		C:: = constructor::

		->
			new C arguments
