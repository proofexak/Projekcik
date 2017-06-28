class AddTypeToBots < ActiveRecord::Migration
  def change
    add_column :bots, :type, :string
  end
end
