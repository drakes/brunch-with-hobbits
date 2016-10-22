module.exports =
	coffeeLintOptions =
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
		max_line_length:
			level: 'ignore'
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
		no_this:
			level: 'warn'
		no_unnecessary_double_quotes:
			level: 'warn'
		prefer_english_operator:
			level: 'warn'
			doubleNotLevel: 'ignore'
		space_operators:
			level: 'warn'
		spacing_after_comma:
			level: 'warn'
