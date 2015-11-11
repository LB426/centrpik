class AddAssessmentToTestingStatAttempts < ActiveRecord::Migration
  def change
    add_column :testing_stat_attempts, :assessment, :string
  end
end
