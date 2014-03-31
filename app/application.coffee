# Testing...
TestModel = require 'testing/backbone-testing/model-test'
# More Testing...
TestApp = require 'testing/backbone-testing/backbone-parse-testing'

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

    return

  startHistory: (options) => Backbone.history.start()

module.exports = Application