module.exports =
	classVisibility: (visible, classes = '') ->
		# classes expected as space-separated string
		"#{classes}#{if visible then '' else ' hidden'}"

	cheapPluralization: (term, countOrList) ->
		count = if typeof countOrList is 'number' then countOrList else countOrList.length
		"#{term}#{if count isnt 1 then 's' else ''}"
