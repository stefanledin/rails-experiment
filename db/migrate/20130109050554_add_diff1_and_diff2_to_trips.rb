class AddDiff1AndDiff2ToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :diff1, :string
    add_column :trips, :diff2, :string
  end
end
