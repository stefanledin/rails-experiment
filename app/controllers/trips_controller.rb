class TripsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		
		if params[:avgangtabell] == params[:avgangverklig]
			avGangITID = true
		else
			avGangITID = false
		end

		if params[:ankomsttabell] == params[:ankomstverklig]
			ankomstITID = true
		else
			ankomstITID = false
		end
			
		Trip.create({
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
