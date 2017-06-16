class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :type
      t.integer :coordinate_x
      t.integer :coordinate_y
      t.belongs_to :bot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
