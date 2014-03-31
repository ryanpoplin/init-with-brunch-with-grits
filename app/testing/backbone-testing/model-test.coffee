# Testing for Backbone.Model...

module.exports = 

class TestModel extends Backbone.Model 
	defaults:
		name: 'Backboner...'
	initialize: ->
		console.log 'TestModel init...'
		@on 'change', ->
			console.log 'Values in this model have changed...'
		return
	setName: (newName) ->
		@set 'name', newName
		return

aTestModel = new TestModel

console.log JSON.stringify aTestModel
console.log aTestModel.get 'name'
console.log aTestModel.toJSON()
aTestModel.set 'awesome', 'true'
console.log aTestModel.get 'awesome'
aTestModel.on 'change:awesome', ->
	console.log 'TestModel\'s \'awesome\' attr has changed...'
aTestModel.set 'awesome', 'false'
console.log aTestModel.hasChanged 'awesome'
console.log aTestModel.hasChanged null
aTestModel.setName 'Poplinr\'s Backbone Quest...'
console.log aTestModel.get 'name'

class User extends Backbone.Model
	validate: (attrs) ->
		console.log 'A name is required...' unless attrs.name

user = new User
user.set 'name', 'Poplinraa'
console.log user.get 'name'
user.unset 'name', validate: true
console.log user.get 'name'
