class PresetsController < ApplicationController
	def index
	end

	def new
		@user = User.where("user_id = ?", session[:fb_user]['id']).first
	end

	def create
		@user = User.where("user_id = ?", session[:fb_user]['id']).first
		@user.presets.create({
			:label => params[:label],
			:from => params[:from],
			:to => params[:to],
			:fromtime => params[:fromtime],
			:totime => params[:totime]
		})

		if @user.save
			redirect_to root_url
		end		
	end

end
