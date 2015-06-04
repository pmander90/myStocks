var StocksRouter = Backbone.Router.extend({
	
	initialize: function initialize() {
		collection = new StocksCollection();
		collection.fetch().done(function(){
			collection.update();
		});
		listView = new StocksListView({collection: collection});
	}
})