class CreateRoutines < ActiveRecord::Migration[5.1]
  def change
    create_table :routines do |t|
      t.string :name
      t.text :products
      t.text :description
      t.integer :user_id
    end
end
