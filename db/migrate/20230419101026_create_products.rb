class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :oriprice
      t.string :disprice
      t.string :brand
      t.string :category

      t.timestamps
    end
  end
end
