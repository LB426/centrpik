class AddCourseIdToTestingStatAttempt < ActiveRecord::Migration
  def change
    add_column :testing_stat_attempts, :course_id, :integer
  end
end
