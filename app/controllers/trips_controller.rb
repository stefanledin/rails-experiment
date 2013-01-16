class TripsController < ApplicationController
	def index
	end

	def show
	end

	def new
		@user = User.where("user_id = ?", session[:fb_user]['id']).first
		if params[:preset]
			@preset = Preset.find(params[:preset])
		end
	end

	def create
		@user = User.where("user_id = ?", session[:fb_user]['id']).first

		if params[:avgangtabell] == params[:avgangverklig]
			avGangITID = true
		else
			avGangITID = false
			avgangtabell = params[:avgangtabell]
			#Split -
			#Time.new(YYYY,MM,DD,HH,MM)
			avgangverklig = params[:avgangverklig]
			diff1 = avgangverklig - avgangtabell
		end

		if params[:ankomsttabell] == params[:ankomstverklig]
			ankomstITID = true
		else
			ankomstITID = false
		end
			
		@user.trips.create({
			:datum => params[:datum],
			:fran => params[:fran],
			:till => params[:till],
			:avgangitid => avGangITID,
			:avgangtabell => params[:avgangtabell],
			:avgangverklig => params[:avgangverklig],
			:ankomstitid => ankomstITID,
			:ankomsttabell => params[:ankomsttabell],
			:ankomstverklig	 => params[:ankomstverklig]
		})

		redirect_to '/'
	end
end
