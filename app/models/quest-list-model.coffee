module.exports = 

	class QuestModel extends Backbone.Model 
		defaults:
			title: 'Quest Title...'
			# What should it be?
			finished: true 
		initialize: ->
			console.log 'QuestModel init...'
			return