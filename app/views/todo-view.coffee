module.exports = class TodoView extends Backbone.View 
	tagName: 'li'
	template: require 'templates/todo-template'
	events:
		'dbclick label': 'edit'
		'keypress .edit': 'updateOnEnter'
		'blur .edit': 'close'
	initialize: ->
		console.log 'TodoView init...'
		@.$el = $('#main')
		return
	render: ->
		@.$el.html @.template @.model.toJSON()
		@.input = @.$('.edit')
		@
	edit: ->
		return
	close: ->
		return
	updateOnEnter: (e) ->
		return