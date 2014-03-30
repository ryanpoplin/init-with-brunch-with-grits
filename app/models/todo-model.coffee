module.exports = class TodoModel extends Backbone.Model 
	defaults:
		title: ''
		completed: false
	initialize: ->
		console.log 'TodoModel init...'
		return