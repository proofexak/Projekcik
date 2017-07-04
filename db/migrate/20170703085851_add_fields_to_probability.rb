class AddFieldsToProbability < ActiveRecord::Migration
  def change
    add_column :probabilities, :gold, :integer
    add_column :probabilities, :supply, :integer
    add_column :probabilities, :raws, :integer
    add_column :probabilities, :medals, :integer
    add_column :probabilities, :development_points, :integer
    add_column :probabilities, :diamonds, :integer
  end
end
