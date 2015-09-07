m = window.m

textWithLinksHelper = (segments) ->
	for segment in segments
		if segment.href
			m 'a', {href: segment.href}, segment.text
		else
			segment

module.exports =
	headerView = (header) ->
		m 'header', [
			m 'h1',
				m 'a', {href: header.vm.homeUrl()}, header.vm.name()
			m 'p', textWithLinksHelper header.vm.lead()
			m 'ul',
				for itemContents in header.vm.featuredItems()
					m 'li', textWithLinksHelper itemContents
			m 'h2', header.vm.subHead()
		]
