class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :weight

      t.timestamps null: false
    end
  end
end
