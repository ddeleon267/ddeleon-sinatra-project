class CreateRoutines < ActiveRecord::Migration[5.1]
  def change
    create_table :routines do |t|
      t.string :name
      t.string :time_of_day
      t.string :season
      t.string :climate
      t.string :products
      t.integer :user_id
    end
end
