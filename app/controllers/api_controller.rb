class ApiController < ApplicationController

	def symbol
		@company = params[:company]
		@symbol = HTTParty.get("http://dev.markitondemand.com/Api/v2/Lookup/jsonp?input=#{@company}&callback=stock")
		render json: @symbol.body
	end

	def stock
		@symbol = params[:symbol]
		@stock = HTTParty.get("http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=#{@symbol}&callback=stock")
		render json: @stock.body
	end

end