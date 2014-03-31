# require...


class Application extends Backbone.Marionette.Application
  initialize: =>
    @on 'initialize:after', @startHistory

    # @addRegions mainRegion: '#main'
    # @mainRegion.show view

    @start()

    return

  startHistory: (options) => Backbone.history.start()

module.exports = Application