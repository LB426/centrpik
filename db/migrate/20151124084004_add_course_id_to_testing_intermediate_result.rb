class AddCourseIdToTestingIntermediateResult < ActiveRecord::Migration
  def change
    add_column :testing_intermediate_results, :course_id, :integer
  end
end
