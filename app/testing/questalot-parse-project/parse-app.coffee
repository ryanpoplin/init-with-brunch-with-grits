module.exports = 

QuestModel = Parse.Object.extend 
	className: 'GameScore'
	defaults: 
		title: 'Questalot Quest...'
	getQuestTitle: ->
		console.log @get('title')
	initialize: ->
		console.log 'QuestModel init...'

console.log QuestModel 

questModelOne = new QuestModel
	title: 'Zombie Quest'

questModelOne.getQuestTitle()

console.log questModelOne

###
questModelOne.save null, {
	success: (questModelOne) ->
		console.log 'Object: ' + questModelOne.id
	error: (questModelOne, error) ->
		console.log error.description
}
###


