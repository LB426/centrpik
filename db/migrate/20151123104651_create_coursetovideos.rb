class CreateCoursetovideos < ActiveRecord::Migration
  def change
    create_table :coursetovideos do |t|
      t.integer :course_id
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
