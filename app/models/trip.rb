class Trip < ActiveRecord::Base
  attr_accessible :till, :ankomstitid, :ankomsttabell, :ankomstverklig, :fran, :avgangitid, :avgangtabell, :avgangverklig, :datum, :user_id
  belongs_to :user
end
