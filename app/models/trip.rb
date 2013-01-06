class Trip < ActiveRecord::Base
  attr_accessible :ankomstitid, :ankomsttabell, :ankomstverklig, :avgangitid, :avgangtabell, :avgangverklig, :datum, :user_id
  belongs_to :user
end
