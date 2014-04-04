module.exports = 

QuestModel = Backbone.Model.extend
		defaults: 
			title: 'Questalot Quest'
		validate: (attrs, options) ->
			unless attrs.title
				return 'Quests must have a title...'
		initialize: ->
			# ...

QuestCollection = Backbone.Collection.extend
	model: QuestModel

# HeaderView...

HeaderView = Backbone.View.extend
	el: '#primary-header'
	template: require 'templates/questalot-header-template'
	initialize: ->
		# ...
	render: ->
		html = @template
		$(@el).html html

# SectionView...

# Config for Questalot tom...
# - Add std. models, collections, and views...
# - Add Parse User funcs...
# - Polish the design along the way...
# - Consult with Marc and Jake...

# Just rip of example for now...
###
SectionView = Backbone.View.extend
	el: '#primary-section'
	template: require 'templates/questalot-section-template'
	initialize: ->
		@listenTo @model, 'change', @render
	render: ->
		questCollection.each( (quest) -> 
			new S
		)
###

# FooterView...

FooterView = Backbone.View.extend
	el: '#primary-footer'
	template: require 'templates/questalot-footer-template'
	initialize: ->
		# ...
	render: ->
		html = @template
		$(@el).html html

Workspace = Backbone.Router.extend
	routes: 
		'': 'home'
	initialize: ->
		@headerView = new HeaderView()
		@headerView.render()
		@footerView = new FooterView()
		@footerView.render()
	home: ->
		zombieQuest = new QuestModel
			title: 'Zombie Quest'
		parkQuest = new QuestModel
			title: 'Park Quest'
		jazzQuest = new QuestModel
			title: 'Jazz Quest'
		questCollection = new QuestCollection
		questCollection.add([
			zombieQuest
			parkQuest
			jazzQuest
		])

$ ->

	# new Workspace()
