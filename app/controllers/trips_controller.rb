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
		# Ladda användaren
		@user = User.where("user_id = ?", session[:fb_user]['id']).first
		
		# Splitta datumet till en hash
		datum = params[:datum].split('-')
		
		# Skapa ett datum för avgången enligt tidtabell
		avgangtabell = params[:avgangtabell].split(':')
		tid1 = Time.new(datum[0],datum[1],datum[2],avgangtabell[0],avgangtabell[1])

		# Skapa ett datum för den verkliga avgångstiden
		avgangverklig = params[:avgangverklig].split(':')
		tid2 = Time.new(datum[0],datum[1],datum[2],avgangverklig[0],avgangverklig[1])

		if tid1 >= tid2
			avGangITID = true
		else
			avGangITID = false
			diff1 = tid2 - tid1
		end

		ankomsttabell = params[:ankomsttabell].split(':')
		tid1 = Time.new(datum[0],datum[1],datum[2],ankomsttabell[0],ankomsttabell[1])
		
		ankomstverklig = params[:ankomstverklig].split(':')
		tid2 = Time.new(datum[0],datum[1],datum[2],ankomstverklig[0],ankomstverklig[1])

		if tid1 >= tid2
			ankomstITID = true
		else
			ankomstITID = false
			diff2 = tid2 - tid1
		end
		
		# Lägg till i databasen
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

	#def constructDate(date,time)
	#	datum = date.split('-')
	#end

end
