class TwilioController < ApplicationController
	
	before_action :authenticate_user!

	def sendnow
		Stock.text(current_user)
		redirect_to '/show'
	end

end