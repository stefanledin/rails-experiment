class Trip < ActiveRecord::Base
  attr_accessible :till, :ankomstitid, :ankomsttabell, :ankomstverklig, :fran, :avgangitid, :avgangtabell, :avgangverklig, :datum, :user_id, :diff1, :diff2
  belongs_to :user
end
