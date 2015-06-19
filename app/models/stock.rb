class Stock < ActiveRecord::Base
	belongs_to :user

	def self.text(user)
		text = "Hello #{user.profile.username}, heres your stocks, "

		user.stocks.each do |stock|
			Stock.update_price(stock)
			text = text + "#{stock.name}: $#{stock.lastprice}. "
		end

		@client= Twilio::REST::Client.new("#{ENV['twilio_sid']}", "#{ENV['twilio_auth']}")
		@client.account.messages.create(
			from: '+12402058377',
			to: user.profile.phone_number,
			body: text
		)
	end

	def self.text_everyone
		@users = User.all
		@users.each do |user|
			Stock.text(user)
		end
	end

	def self.update_price(stock)
		@stock_info = HTTParty.get("http://dev.markitondemand.com/Api/v2/Quote?symbol=#{stock.symbol}&callback=stock")
		price = @stock_info.parsed_response["StockQuote"]["LastPrice"]
		stock.update(lastprice: price)
	end


end
