module.exports = 

QuestModel = Parse.Object.extend 
	className: 'QuestalotQuest'
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

console.log questModelOne.get('title')

console.log questModelOne

###
questModelOne.save null, {
	success: (questModelOne) ->
		console.log 'Object: ' + questModelOne.id
	error: (questModelOne, error) ->
		console.log error.description
}
###

questModelTwo = new QuestModel
	title: 'Lantern Quest'

###
questModelTwo.save null, {
	success: (questModelTwo) ->
		console.log 'Object: ' + questModelTwo.id
		objectId = questModelTwo.id
		updatedAt = questModelTwo.updatedAt
		createdAt = questModelTwo.createdAt
		console.log objectId
		console.log updatedAt
		console.log createdAt
	error: (questModelTwo, error) ->
		console.log error.description
}
###

###
questQuery = new Parse.Query QuestModel

questQuery.get 'gFPOrQ3FTG', {
	success: (questModel) ->
		console.log 'Yay...'
	error: (questModel, error) ->
		console.log error.description
}
###

questModelTwo.fetch({
	success: (questModelTwo) ->
		console.log 'A refreshed model...'
	error: (questModelTwo, error) ->
		console.log error.description
})