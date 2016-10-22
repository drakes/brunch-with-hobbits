module.exports =
	cheapPluralization: (term, countOrList) ->
		count = if typeof countOrList is 'number' then countOrList else countOrList.length
		"#{term}#{if count isnt 1 then 's' else ''}"
