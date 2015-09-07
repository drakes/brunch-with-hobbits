exec = require('child_process').exec
path = require 'path'
notifier = require 'node-notifier'

icon =
	pass: path.join __dirname, 'pass.png'
	fail: path.join __dirname, 'fail.png'

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
	# assumes default port
	command = 'mocha-phantomjs --reporter progress http://localhost:3333/test/'
	try
		exec command, notifyTestResults
	catch error
		notifyTestResults {code: 1}, "error running tests: #{JSON.stringify error}"

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
		|bower_components # or instead of all that, bower dependencies
	)
	///
vendorStylesheetsPattern = ///^
	(
		vendor
		[\\/] # path separator
		(?!test) # exclude vendor/test stylesheets
		|bower_components # or instead of all that, bower dependencies
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
	notifications: [
		'error'
	]
	plugins:
		postBrunch: postBrunchTasks
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
			options:
				arrow_spacing:
					level: 'warn'
				braces_spacing:
					level: 'warn'
					spaces: 0
				colon_assignment_spacing:
					level: 'warn'
					spacing:
						left: 0
						right: 1
				cyclomatic_complexity:
					level: 'warn'
					value: 10
				indentation:
					level: 'error'
					value: 1
				line_endings:
					level: 'warn'
				max_line_length:
					level: 'warn'
					value: 120
					limitComments: yes
				missing_fat_arrows:
					level: 'warn'
				newlines_after_classes:
					level: 'warn'
					value: 2
				no_empty_param_list:
					level: 'warn'
				no_interpolation_in_single_quotes:
					level: 'warn'
				no_tabs:
					level: 'ignore'
				no_unnecessary_double_quotes:
					level: 'warn'
				prefer_english_operator:
					level: 'warn'
					doubleNotLevel: 'ignore'
				space_operators:
					level: 'warn'
				spacing_after_comma:
					level: 'warn'
	sourceMaps: no
	overrides:
		production:
			plugins:
				# override postBrunch tasks, they're considered development-time only (e.g. testing and styleguide)
				postBrunch: ->
