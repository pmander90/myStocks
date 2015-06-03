var StocksListView = Backbone.View.extend ({
	el: '#stocklist',

	initialize: function() {
		console.log("created StocksListView");
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.renderOne);
	},

	renderOne: function(stock) {
    	var view = new StockView({model: stock});
    	this.$el.append(view.$el);
  	},
  	
  	renderAll: function() {
    	this.$el.empty();
    	this.collection.each(this.renderOne.bind(this));
  	}

})