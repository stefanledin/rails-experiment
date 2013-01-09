class HomeController < ApplicationController

  def index
  	@presets = Preset.all
  	@trips = Trip.all
  end

end
