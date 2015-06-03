var StocksCollection = Backbone.Collection.extend ({
	model: StockModel,
	url: '/stocks'
})