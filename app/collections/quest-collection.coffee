QuestModel = require 'models/quest-model'

module.exports = 

	class QuestCollection extends Backbone.Collection
		model: QuestModel
		initialize: ->
			console.log 'QuestCollection init...'