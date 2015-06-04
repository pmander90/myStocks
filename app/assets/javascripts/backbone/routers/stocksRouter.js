var StocksRouter = Backbone.Router.extend({
	
	initialize: function initialize() {
		collection = new StocksCollection();
		listView = new StocksListView({collection: collection});
		collection.fetch({reset: true});
	}
})