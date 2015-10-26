class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.integer :test_id
      t.string :question

      t.timestamps null: false
    end
  end
end
