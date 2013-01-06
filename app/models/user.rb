class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :user_id
  has_many :presets, :dependent => :destroy
  has_many :trips, :dependent => :destroy
end
