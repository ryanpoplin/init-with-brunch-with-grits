TodoModel = require 'models/todo-model'
TodoView = require 'views/todo-view'

class Application extends Backbone.Marionette.Application
  initialize: =>
  	@on 'initialize:after', @startHistory

  	aTodo = new TodoModel title: 'Todo 1...'
  	aTodoView = new TodoView model: aTodo

  	# Temp...
  	aTodoView.render()

    # @addRegions mainRegion: '#main'
    # @mainRegion.show view

  	@start()

  startHistory: (options) => Backbone.history.start()

module.exports = Application
