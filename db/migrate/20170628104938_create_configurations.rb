class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.belongs_to :bot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
