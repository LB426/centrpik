class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :test_question_id
      t.text :ans_text
      t.boolean :proper

      t.timestamps null: false
    end
  end
end
