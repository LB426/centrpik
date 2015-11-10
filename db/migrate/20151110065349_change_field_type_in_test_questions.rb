class ChangeFieldTypeInTestQuestions < ActiveRecord::Migration
  def change
    change_column :test_questions, :question, :text
  end
end
