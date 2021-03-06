###
module.exports =

InvoiceItemModel = Backbone.Model.extend
	defaults: 
		date: new Date()
		description: 'Something Tech Related'
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


	invoiceList: ->
		invoiceListView = new InvoiceListView
			el: $('#main')
		invoiceListView.render()
	invoicePage: (id) ->
		invoicePageView = new InvoicePageView
			el: $('#main')
			id: id
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
		invoiceItemModel3 = new InvoiceItemModel
			price: 2500
			quantity: 2
		console.log invoiceItemModel3.toJSON()
		newModel = invoiceItemModel.clone()
		console.log newModel
		previewInvoiceItemView = new PreviewInvoiceItemView
			model: invoiceItemModel2
			el: $('#main')
		previewInvoiceItemView.render()
		console.log invoiceItemModel.toJSON()

		The Billing App...
		'*actions': 'home'
		'invoice': 'invoiceList'
		'invoice/:id': 'invoicePage'
		 'previewInvoice': 'previewInvoice'
	###