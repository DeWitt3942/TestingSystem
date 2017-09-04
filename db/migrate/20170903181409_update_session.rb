class UpdateSession < ActiveRecord::Migration[5.0]
  def change
  	add_column :sessions, :user_id, :integer
  	add_column :sessions, :test_id, :integer

  end
end
