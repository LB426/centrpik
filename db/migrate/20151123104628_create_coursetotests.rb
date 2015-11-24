class CreateCoursetotests < ActiveRecord::Migration
  def change
    create_table :coursetotests do |t|
      t.integer :course_id
      t.integer :test_id

      t.timestamps null: false
    end
  end
end
