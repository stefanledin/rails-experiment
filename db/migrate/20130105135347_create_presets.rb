class CreatePresets < ActiveRecord::Migration
  def change
    create_table :presets do |t|
      t.string :label
      t.string :from
      t.string :fromtime
      t.string :to
      t.string :totime
      t.integer :user_id

      t.timestamps
    end
  end
end
