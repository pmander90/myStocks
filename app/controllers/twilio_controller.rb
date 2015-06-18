class TwilioController < ApplicationController
	
	def sendnow
		# Stock.text(current_user)
		redirect_to '/show'
	end

end