var StocksCollection = Backbone.Collection.extend ({
	model: StockModel,
	url: '/stocks',
	update: function(){
		_.each(collection.models, function(model){
			$.ajax({
				type: 'GET',
				dataType: 'jsonp',
				jsonp: 'callback',
				url: 'http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=' + model.attributes.symbol
			}).done(function(data){
				model.set({
					high: data.High,
					lastprice: data.LastPrice,
					low: data.Low,
					open: data.Open
				})
				model.save()
			})
		})
	}
})
