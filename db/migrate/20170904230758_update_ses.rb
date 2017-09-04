class UpdateSes < ActiveRecord::Migration[5.0]
  def change
  	change_column :sessions, :data, :text, :default => "{ \"question\": 0,  \"answers\": [] }"
  end
end
