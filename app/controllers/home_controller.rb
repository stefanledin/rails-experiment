class HomeController < ApplicationController

	require 'koala'

	def index
		@oauth = Koala::Facebook::OAuth.new('APPID','APPSECRET', root_url )
		
		# När man skickas tillbaka från inloggningsrutan 
		if params[:code] && !session[:fb_user]
			@graph = Koala::Facebook::API.new(@oauth.get_access_token(params[:code]))
			session[:fb_user] = @graph.get_object('me')
		end

		if session[:fb_user]
			@user = User.where("user_id = ?", session[:fb_user]['id']).first
			if @user.nil?
				redirect_to '/register'
			end
			
			@presets = @user.presets.all
			@trips = @user.trips.all
		end

	end

	def login
	end

	def register
		@user = User.create({
			:first_name => session[:fb_user]['first_name'],
			:last_name => session[:fb_user]['last_name'],
			:user_id => session[:fb_user]['id']	
		})
		if @user.save
			redirect_to root_url						
		end
	end

	def logout
		#session[:access_token] = nil
		session[:fb_user] = nil
		redirect_to root_url
	end

end
