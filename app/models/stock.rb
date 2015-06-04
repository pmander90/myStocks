class Stock < ActiveRecord::Base
	belongs_to :user

	def texting
		text = "Hello #{current_user.profile.username}, heres your stocks, "
		current_user.stocks.each do |stock|
			text = text + "#{stock.name}: $#{stock.lastprice}. "
		end
		@client= Twilio::REST::Client.new("#{ENV['twilio_sid']}", "#{ENV['twilio_auth']}")
		@client.account.messages.create(
			from: '+12402058377',
			to: current_user.profile.phone_number,
			body: text
		)
	end
end
