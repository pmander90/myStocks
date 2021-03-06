// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require_tree ./backbone/routers
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require handlebars.runtime
//= require_tree .



var ready = function loadStocksApp(){
		new StocksRouter();
		var addStock = $("#addStock");
		var stockList = $('#stocklist')
		var popup = $("#abc");
		addStock.on("click", function(){
			popup.show();
			stockList.css({"position": "absolute", "z-index": "-1"});
		})


		var send = $("#send");
		var newCompany = $("#newCompany");
		send.click(function() {
			if (newCompany.val() === "") {
				alert("Nothing Was Entered!");
			} else {
				popup.hide();
				stockList.css({"position": "relative", "z-index": "1"});
				findStock = function(){
					$.ajax({
					type: 'GET',
					dataType: 'json',
					url: '/partysymbol?company=' + newCompany.val()
				}).done(function(data){
					$.ajax({
						type: 'GET',
						dataType: 'json',
						url: '/partystock?symbol=' + data[0].Symbol
					}).done(function(data1){
						collection.create({name: data1.Name, symbol: data1.Symbol, lastprice: data1.LastPrice, open: data1.Open, high: data1.High, low: data1.Low});
					})
				})
			}
				findStock();
				newCompany.val('');

			}
		})
		
		var close = $("#closePopup");
		close.on("click", function() {
			event.preventDefault();
			stockList.css({"position": "relative", "z-index": "1"});
			popup.hide();
		})

	}



$(document).ready(ready);
$(document).on('page:load', ready);
