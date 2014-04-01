module.exports = 

InvoiceItemModel = Backbone.Model.extend
	defaults: 
		price: 0
		quantity: 0
	calculateAmount: ->
		@get('price') * @get('quantity')

PreviewInvoiceItemView = Backbone.View.extend
	template: require 'templates/preview-invoice-item-template'
	render: ->
		html = @template({
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

Workspace = Backbone.Router.extend
	routes: 
		'': 'invoiceList'
		'invoice': 'invoiceList'
		'invoice/:id': 'invoicePage'
		'previewInvoice': 'previewInvoice'
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
			price: 2
			quantity: 3
		previewInvoiceItemView = new PreviewInvoiceItemView
			model: invoiceItemModel
			el: $('#main')
		previewInvoiceItemView.render()

$ ->
	
	new Workspace()
