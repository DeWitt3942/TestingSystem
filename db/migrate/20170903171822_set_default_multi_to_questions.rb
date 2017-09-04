class SetDefaultMultiToQuestions < ActiveRecord::Migration[5.0]
  def change

	change_column :questions, :multi, :boolean, :default => false
  end
end
