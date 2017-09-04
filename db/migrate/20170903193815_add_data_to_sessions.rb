class AddDataToSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :data, :text
  end
end
