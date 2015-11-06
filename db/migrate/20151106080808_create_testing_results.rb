class CreateTestingResults < ActiveRecord::Migration
  def change
    create_table :testing_results do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :test_question_id
      t.integer :answer_id
      t.boolean :proper
      t.integer :attempt

      t.timestamps null: false
    end
  end
end
