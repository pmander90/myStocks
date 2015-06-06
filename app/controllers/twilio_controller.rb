class TwilioController < ApplicationController
	# this probably doesn't need to be it's own controller, since it's sending
	# stock info, I'd include it in stocks controller.
	# also, the name of this method / action could be improved, perhaps
	# `notify` or `send_notifications`
	def sendnow
		# good job breaking this out into a model method.
		Stock.text(current_user)
		redirect_to '/show'
	end

end
