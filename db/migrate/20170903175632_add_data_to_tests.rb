class AddDataToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :data, :text
  end
end
