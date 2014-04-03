# Include Questalot stuff...

QuestListModel = require 'models/quest-list-model'
QuestListCollection = require 'collections/quest-list-collection'
QuestListView = require 'views/quest-list-view'

module.exports = 

# The Billing App...

InvoiceItemModel = Backbone.Model.extend
	defaults: 
		date: new Date()
		description: 'Something Tech Related...'
		price: 0
		quantity: 1
	calculateAmount: ->
		@get('price') * @get('quantity')

PreviewInvoiceItemView = Backbone.View.extend
	template: require 'templates/preview-invoice-item-template'
	render: ->
		html = @template({
			description: @model.get 'description'
			date: @model.get 'date'
			price: @model.get 'price'
			quantity: @model.get 'quantity'
			amount: @model.calculateAmount()
		})
		$(@el).html html

InvoiceListView = Backbone.View.extend
	template: require 'templates/invoice-list-view-template'
	render: ->
		html = @template
		$(@el).html html

InvoicePageView = Backbone.View.extend
	template: require 'templates/invoice-page-view-template'
	render: (id) ->
		html = @template({
			id: id
		})
		$(@el).html html

# Questalot's Backbone and Parse Prototype...

# Message...

Message = Parse.Object.extend
	className: 'MessageBoard'

# Collection...

MessageBoard = Parse.Collection.extend
	model: Message

# HeaderView...

HeaderView = Backbone.View.extend
	el: '#primary-header'
	template: require 'templates/questalot-header-template'
	initialize: ->
		# ...
	render: ->
		html = @template
		$(@el).html html

# HomeView...

HomeView = Backbone.View.extend
	el: '#primary-section'
	template: require 'templates/questalot-home-template'
	events: 
		'click #send': 'saveMessage'
	initialize: (message) ->
		@collection = new MessageBoard()
		@collection.bind 'all', @render, @
		@collection.fetch()
		@collection.on 'add', (message) ->
			message.save(null, {
				success: (message) ->
					console.log 'Saved ' + message
				error: (message) ->
					console.log 'Error...'
			})
		console.log 'Saved ' + message
	saveMessage: ->
		username = $('#username').val()
		message = $('#message').val()
		@collection.add({
			username: username
			message: message
		})
	render: ->
		html = @template
		collection = @collection
		$(@el).html html, collection

# FooterView...

FooterView = Backbone.View.extend
	el: '#primary-footer'
	template: require 'templates/questalot-footer-template'
	initialize: ->
		# ...
	render: ->
		html = @template
		$(@el).html html

# Multi-App Router...

Workspace = Backbone.Router.extend
	routes: 
		'': 'home'
		# '*actions': 'home'
		# 'invoice': 'invoiceList'
		# 'invoice/:id': 'invoicePage'
		# 'previewInvoice': 'previewInvoice'
	initialize: ->
		@headerView = new HeaderView()
		@headerView.render()
		@footerView = new FooterView()
		@footerView.render()
	home: ->
		@homeView = new HomeView()
		@homeView.render()
	# Possible...
	signup: ->
		# ...
	questList: ->
		# questListModel = new QuestListModel
		questListView = new QuestListView 
			el: $('#main')
		questListView.render()
	# The Billing App...
	invoiceList: ->
		invoiceListView = new InvoiceListView
			el: $('#main')
		invoiceListView.render()
	invoicePage: (id) ->
		invoicePageView = new InvoicePageView
			el: $('#main')
			id: id
		# ...
		invoicePageId = invoicePageView.id
		invoicePageView.render(invoicePageId)
	previewInvoice: ->
		invoiceItemModel = new InvoiceItemModel
			date: new Date()
			description: 'Web App Development...'
			price: 2000
			quantity: 1
		invoiceItemModel2 = new InvoiceItemModel
			price: 500
			quantity: 5
		console.log invoiceItemModel2.toJSON()
		# Cheap commit...
		invoiceItemModel3 = new InvoiceItemModel
			price: 2500
			quantity: 2
		console.log invoiceItemModel3.toJSON()
		# Testing...
		newModel = invoiceItemModel.clone()
		console.log newModel
		previewInvoiceItemView = new PreviewInvoiceItemView
			model: invoiceItemModel2
			el: $('#main')
		previewInvoiceItemView.render()
		# Testing...
		console.log invoiceItemModel.toJSON()

$ ->
	
	new Workspace()
