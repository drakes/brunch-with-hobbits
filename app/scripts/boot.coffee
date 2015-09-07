m = window.m
docReady = window.docReady

App =
	controller: require 'controllers/app'
	view: require 'views/app'

docReady ->
	listContainer = document.getElementById 'listContainer'
	m.mount listContainer, App
