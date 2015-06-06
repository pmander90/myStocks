var StocksCollection = Backbone.Collection.extend ({
	model: StockModel,
	url: '/stocks',
	update: function(){
		_.each(collection.models, function(model){
			//this code should probably live in the stock model, since it's about updating
			// a single stock (then the collection#update function can just call stock#update
			//on each model instance in the collection.)
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
