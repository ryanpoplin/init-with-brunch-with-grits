module.exports = 

QuestModel = Parse.Object.extend 
	className: 'QuestalotQuest'
	defaults: 
		title: 'Questalot Quest...'
		points: 0
	getQuestTitle: ->
		console.log @get('title')
	getPoints: ->
		console.log @get('points')
	addPoints: ->
		# questPoints.increment('score')
		# questPoints.save()
	initialize: ->
		console.log 'QuestModel init...'

# console.log QuestModel 

questModelOne = new QuestModel
	title: 'Zombie Quest'

###
questModelOne.getQuestTitle()

console.log questModelOne.get('title')

console.log questModelOne
###

###
questModelOne.save null, {
	success: (questModelOne) ->
		console.log 'Object: ' + questModelOne.id
		questId = questModelOne.id
	error: (questModelOne, error) ->
		console.log error.description
}
###

###
questModelOne.id = 'WLGO2qnBNx'
questModelOne.destroy({
	success: (questModelOne) ->
		console.log 'Destroy...'
	error: (questModelOne, error) ->
		console.log error.description
})
###

###
questModelTwo = new QuestModel
	title: 'Lantern Quest'
###

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

questQuery.get 'O56bE8f6F3', {
	success: (questModel) ->
		console.log 'Yay...'
	error: (questModel, error) ->
		console.log error.description
}

questOneTitle = questQuery
console.log questOneTitle
###

###
questOne = questQuery

console.log questOne
###

###
questModelTwo.fetch({
	success: (questModelTwo) ->
		console.log 'A refreshed model...'
	error: (questModelTwo, error) ->
		console.log error.description
})
###

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
		questModelTwo.set('title', 'Awesome Quest')
		questModelTwo.save()
	error: (questModelTwo, error) ->
		console.log error.description
}
###

###
questModelTwoId = undefined
questModelTwo.

questModelTwo.destroy({
	success: (questModelTwo) ->
		console.log 'Destroy...'
	error: (questModelTwo, error) ->
		console.log error.description
})
###

