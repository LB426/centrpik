class CreateCoursetobooks < ActiveRecord::Migration
  def change
    create_table :coursetobooks do |t|
      t.integer :course_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
