m = window.m
docReady = window.docReady

ToDoListController = require 'controllers/todo-list'
toDoListView = require 'views/todo-list'

initialListItems = [
	'First order of business'
	'Second business order'
	'Anyone order a pizza?'
]
bootstrapList = ->
	->
		new ToDoListController initialListItems

docReady ->
	listContainer = document.getElementById 'listContainer'
	m.mount listContainer,
		controller: bootstrapList()
		view: toDoListView
