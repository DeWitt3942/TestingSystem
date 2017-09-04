class UpdateStateOfSessions < ActiveRecord::Migration[5.0]
  def change
  	change_column :sessions, :state, :integer, :default => 0
  end
end
