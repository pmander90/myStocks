class Stock < ActiveRecord::Base
	belongs_to :user

	def self.text(current_user)
		# typo in text, should be "here are your stocks" :)
		text = "Hello #{current_user.profile.username}, heres your stocks, "
		current_user.stocks.each do |stock|
			text = text + "#{stock.name}: $#{stock.lastprice}. "
		end
		# good job using env vars!
		@client= Twilio::REST::Client.new("#{ENV['twilio_sid']}", "#{ENV['twilio_auth']}")
		@client.account.messages.create(
			from: '+12402058377',
			to: current_user.profile.phone_number,
			body: text
		)
	end

	# this method only texts the first user, so it's not doing what it says!
	def self.texteveryone
		Stock.text(User.first)
	end

end
