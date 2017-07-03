class AddFieldsToProbability < ActiveRecord::Migration
  def change
    change_column :probabilities, :gold, :integer, :default => 0
    add_column :probabilities, :supply, :integer
    add_column :probabilities, :raws, :integer
    add_column :probabilities, :medals, :integer
    add_column :probabilities, :development_points, :integer
    add_column :probabilities, :diamonds, :integer
  end
end
