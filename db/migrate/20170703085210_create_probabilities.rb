class CreateProbabilities < ActiveRecord::Migration
  def change
    create_table :probabilities do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
