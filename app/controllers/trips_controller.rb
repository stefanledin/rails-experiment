class TripsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		Trip.create({
			:datum => params[:datum],
			:fran => params[:fran],
			:till => params[:till],
			:avgangtabell => params[:avgangtabell],
			:avgangverklig => params[:avgangverklig],
			:ankomsttabell => params[:ankomsttabell],
			:ankomstverklig	 => params[:ankomstverklig]
		})
	end
end
