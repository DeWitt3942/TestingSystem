class CreateTQconnections < ActiveRecord::Migration[5.0]
  def change
    create_table :t_qconnections do |t|
      t.integer :test_id
      t.integer :question_id

      t.timestamps
    end
  end
end
