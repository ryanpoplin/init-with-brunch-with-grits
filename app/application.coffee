###
	This software is open-sourced...
	Produced by the development team at Byrdann Fox...
###

# require 'programming/test'
TodoModel = require 'models/todo-model'
TodoView = require 'views/todo-view'
# QuestView = require 'views/index-view'

class Application extends Backbone.Marionette.Application
  initialize: =>
  	@on 'initialize:after', @startHistory

  	aTodo = new TodoModel title: 'Todo 1...'
  	aTodoView = new TodoView model: aTodo

  	# Temp...
  	aTodoView.render()

    # questView = new QuestView
    # @addRegions mainRegion: '#main'
    # @mainRegion.show view

  	@start()

  startHistory: (options) => Backbone.history.start()

module.exports = Application
