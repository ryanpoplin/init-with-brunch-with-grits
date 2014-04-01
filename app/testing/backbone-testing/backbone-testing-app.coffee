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

$ ->

	invoiceItemModel = new InvoiceItemModel
		price: 2
		quantity: 3

	previewInvoiceItemView = new PreviewInvoiceItemView
		model: invoiceItemModel
		el: $('#main')

	previewInvoiceItemView.render()
