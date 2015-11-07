class CreateTestingIntermediateResults < ActiveRecord::Migration
  def change
    create_table :testing_intermediate_results do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :test_question_id
      t.integer :answer_id
      t.boolean :proper

      t.timestamps null: false
    end
    add_index :testing_intermediate_results, :user_id
    add_index :testing_intermediate_results, :test_id
    add_index :testing_intermediate_results, :test_question_id
    add_index :testing_intermediate_results, :answer_id
  end
end
