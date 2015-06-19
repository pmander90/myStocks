class ProfilesController < ApplicationController
	
	before_action :authenticate_user!

	def new
		@profile = Profile.new
	end

	def show
		@profile = current_user.profile
	end

	def create
		@profile = Profile.new(user_id: current_user.id, username: params[:username], phone_number: params[:phone_number])
		if @profile.save
			render :show
		else
			render :new
		end
	end

end