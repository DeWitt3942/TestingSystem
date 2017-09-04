class AddStateToSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :state, :integer
  end
end
