class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.date :datum
      t.string :avgangtabell
      t.string :avgangverklig
      t.boolean :avgangitid
      t.string :ankomsttabell
      t.string :ankomstverklig
      t.boolean :ankomstitid

      t.timestamps
    end
  end
end
