class AddFranAndTillToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :fran, :string
    add_column :trips, :till, :string
  end
end
