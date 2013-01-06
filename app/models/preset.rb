class Preset < ActiveRecord::Base
  attr_accessible :from, :fromtime, :label, :to, :totime
  belongs_to :user
end
