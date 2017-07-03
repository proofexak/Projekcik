class AddSupplyToProbabilities < ActiveRecord::Migration
  def change
    change_column :probabilities, :supply, :integer, :default => 0
    change_column :probabilities, :raws, :integer, :default => 0
    change_column :probabilities, :medals, :integer, :default => 0
    change_column :probabilities, :development_points, :integer, :default => 0
    change_column :probabilities, :diamonds, :integer, :default => 0
  end
end
