class HomeController < ApplicationController

  def index
  	@presets = Preset.all
  end

end
