docReady = require 'doc-ready'
m = require 'mithril'

App = require 'controllers/app'

docReady ->
	mountPoint = document.getElementById 'listContainer'
	m.mount mountPoint, App
