class AddMultiToQuestions < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :multi, :boolean
  end
end
