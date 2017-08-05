{exec} = require 'child_process'
path = require 'path'

autoprefixer = require 'autoprefixer'
notifier = require 'node-notifier'
pushserve = require 'pushserve'

coffeelintOptions = require './coffeelint-options'

icon =
	pass: path.join __dirname, 'pass.png'
	fail: path.join __dirname, 'fail.png'

# assumes default port
port = 3333

postBrunchTasks = ->
	buildStyleGuide()
	runTests()

buildStyleGuide = ->
	# include compiled stylesheets so the guide can be used to create accurate styles
	# in isolation from the rest of the frontend
	command = "styledocco
		--out public/style-guide
		--include public/stylesheets/app.css
		--include public/stylesheets/vendor.css
		--preprocessor 'stylus -p' app/stylesheets"
	exec command

runTests = ->
	command = "phantomjs ./node_modules/mocha-phantomjs-core/mocha-phantomjs-core.js http://localhost:#{port}/test/ progress"
	try
		exec command, notifyTestResults
	catch error
		notifyTestResults {code: 1}, "error running tests: #{JSON.stringify error}"

runCITests = ->
	# assumes default port
	command = "phantomjs ./node_modules/mocha-phantomjs-core/mocha-phantomjs-core.js http://localhost:#{port}/test/ xunit > test-results.xml"
	server = pushserve {port, path: 'public'}, ->
		exec command, ->
			server.close()

notifyTestResults = (error, stdout) ->
	success = not error? or error.code is 0
	notifier.notify
		title: 'Brunch: Tests'
		message: "#{if success then 'Passed' else 'Failed'}!"
		sound: on
		icon: if success then icon.pass else icon.fail
	if success
		console.log 'tests passed'
	else if stdout
		console.log "test(s) failed: #{stdout}"

appPattern = /^app/
testPattern = /^test/
# block regexes (http://coffeescript.org/#regexes)
vendorScriptsPattern = ///^ # all matches must start at beginning of string
	(
		vendor
		[\\/] # path separator
		(?!test) # exclude vendor/test scripts
		|node_modules # or instead of all that, npm dependencies
	)
	///
vendorStylesheetsPattern = ///^
	(
		vendor
		[\\/] # path separator
		(?!test) # exclude vendor/test stylesheets
		|node_modules # or instead of all that, npm dependencies
	)
	///
vendorTestPattern = ///^
	vendor
	[\\/] # path separator
	test
	///

exports.config =
	files:
		javascripts:
			joinTo:
				'javascripts/app.js': appPattern
				'javascripts/vendor.js': vendorScriptsPattern
				'test/javascripts/test.js': testPattern
				'test/javascripts/vendor.js': vendorTestPattern
		stylesheets:
			joinTo:
				'stylesheets/app.css': appPattern
				'stylesheets/vendor.css': vendorStylesheetsPattern
				'test/stylesheets/test.css': testPattern
				'test/stylesheets/vendor.css': vendorTestPattern
	modules:
		nameCleaner: (path) ->
			path.replace(///^
				app
				[\\/] # path separator
				scripts
				[\\/] # path separator
				///, '')
	plugins:
		postBrunch: postBrunchTasks
		postcss:
			processors: autoprefixer
		coffeelint:
			pattern: ///^
				(
					app
					|test # app or test directory
				)
				[\\/] # path separator
				.* # allow subdirectories and any file name
				\.coffee$ # that ends in .coffee
				///
			options: coffeelintOptions
	sourceMaps: no
	overrides:
		production:
			plugins:
				# override postBrunch tasks, they're considered development-time only (e.g. testing and styleguide)
				postBrunch: ->
		test:
			plugins:
				postBrunch: runCITests
