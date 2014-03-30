# Testing...
TestModel = require 'testing/random-testing/model-test'

QuestModel = require 'models/quest-model'
QuestView = require 'views/quest-view'

class Application extends Backbone.Marionette.Application
  initialize: =>
    @on 'initialize:after', @startHistory

    aQuest = new QuestModel title: 'Quest One...'
    aQuestView = new QuestView model: aQuest

    # Temp...
    aQuestView.render()

    # @addRegions mainRegion: '#main'
    # @mainRegion.show view

    @start()

  startHistory: (options) => Backbone.history.start()

module.exports = Application