class ChangeDiffColumnTypeToInteger < ActiveRecord::Migration
  def up
  	remove_column :trips, :diff1
  	remove_column :trips, :diff2
  	add_column :trips, :diff1, :integer
  	add_column :trips, :diff2, :integer
  	change_column :trips, :datum, :datetime
  end

  def down
  	add_column :trips, :diff1,:string
  	add_column :trips, :diff2,:string
  	remove_column :trips, :diff1
  	remove_column :trips, :diff2
  	change_column :trips, :datum, :date
  end
end
