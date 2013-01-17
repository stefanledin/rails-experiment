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
		datum = params[:datum]
		datum = datum.split('-')
		
		if params[:avgangtabell] == params[:avgangverklig]
			avGangITID = true
		else
			avGangITID = false
			
			avgangtabell = params[:avgangtabell].split(':')
			tid1 = Time.new(datum[0],datum[1],datum[2],avgangtabell[0],avgangtabell[1])
			
			avgangverklig = params[:avgangverklig].split(':')
			tid2 = Time.new(datum[0],datum[1],datum[2],avgangverklig[0],avgangverklig[1])
			
			diff1 = tid2 - tid1
		end

		if params[:ankomsttabell] == params[:ankomstverklig]
			ankomstITID = true
		else
			ankomstITID = false

			ankomsttabell = params[:ankomsttabell].split(':')
			tid1 = Time.new(datum[0],datum[1],datum[2],ankomsttabell[0],ankomsttabell[1])
			
			ankomstverklig = params[:ankomstverklig].split(':')
			tid2 = Time.new(datum[0],datum[1],datum[2],ankomstverklig[0],ankomstverklig[1])
			
			diff2 = tid2 - tid1

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
			:ankomstverklig	 => params[:ankomstverklig],
			:diff1 => diff1,
			:diff2 => diff2
		})

		redirect_to '/'
	end
end
