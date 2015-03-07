exec = require('child_process').exec
path = require 'path'
notifier = require 'node-notifier'

icon =
	pass: path.join __dirname, 'pass.png'
	fail: path.join __dirname, 'fail.png'

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

exports.config =
	files:
		javascripts:
			joinTo:
				'javascripts/app.js': /^app/
				# block regexes (http://coffeescript.org/#regexes)
				'javascripts/vendor.js': ///^ # all matches must start at beginning of string
					(
						vendor
						[\\/] # path separator
						(?!test) # exclude vendor/test scripts
						|bower_components # or instead of all that, bower dependencies
					)
					///
				'test/javascripts/test.js': /^test/
				'test/javascripts/vendor.js': ///^
					vendor
					[\\/] # path separator
					test
					///
		stylesheets:
			joinTo:
				'stylesheets/app.css': /^app/
				'stylesheets/vendor.css': ///^
					vendor
					[\\/] # path separator
					(?!test) # exclude vendor/test stylesheets
					///
				'test/stylesheets/test.css': /^test/
				'test/stylesheets/vendor.css': ///^
					vendor
					[\\/] # path separator
					test
					///
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
		'warn'
	]
	plugins:
		postBrunch: runTests
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
