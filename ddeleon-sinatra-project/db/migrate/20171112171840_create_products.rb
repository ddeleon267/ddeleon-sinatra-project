class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.text :ingredients
      t.string :notes
    end
  end
end
