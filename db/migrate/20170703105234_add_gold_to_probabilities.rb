class AddGoldToProbabilities < ActiveRecord::Migration
  def change
    change_column :probabilities, :gold, :integer, :default => 0
  end
end
