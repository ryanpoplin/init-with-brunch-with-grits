module.exports = class TestModel extends Backbone.Model 
	defaults:
		name: 'Testing Model...'
	initialize: ->
		console.log 'TestModel init...'