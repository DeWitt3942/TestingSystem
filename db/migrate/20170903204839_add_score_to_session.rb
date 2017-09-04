class AddScoreToSession < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :score, :float
  end
end
