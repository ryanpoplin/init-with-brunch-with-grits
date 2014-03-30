# Testing for Backbone.Model...

module.exports = class TestModel extends Backbone.Model 
	defaults:
		name: 'Testing Model...'
	initialize: ->
		console.log 'TestModel init...'

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




