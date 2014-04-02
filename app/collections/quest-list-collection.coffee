QuestModel = require 'models/quest-list-model'

module.exports = 

	class QuestCollection extends Backbone.Collection
		model: QuestModel
		initialize: ->
			console.log 'QuestCollection init...'