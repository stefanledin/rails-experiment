class PresetsController < ApplicationController
	def index
	end

	def show
		@preset = Preset.find(params[:id])
	end

	def new
		@user = User.where("user_id = ?", session[:fb_user]['id']).first
	end

	def edit
		@preset = Preset.find(params[:id])
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

	def update
		@preset = Preset.find(params[:id])
		if @preset.update_attributes(params[:post])
			redirect_to @preset
		end
	end

end
