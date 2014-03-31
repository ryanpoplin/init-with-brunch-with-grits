module.exports = 

	class QuestModel extends Backbone.Model 
		defaults:
			title: ''
			completed: false
		initialize: ->
			console.log 'QuestModel init...'
			return