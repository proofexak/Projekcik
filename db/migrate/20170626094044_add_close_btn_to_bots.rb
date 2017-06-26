class AddCloseBtnToBots < ActiveRecord::Migration
  def change
    add_column :bots, :close_x, :integer
    add_column :bots, :close_y, :integer
  end
end
