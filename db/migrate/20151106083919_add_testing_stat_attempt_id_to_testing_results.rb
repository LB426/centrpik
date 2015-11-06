class AddTestingStatAttemptIdToTestingResults < ActiveRecord::Migration
  def change
    add_column :testing_results, :testing_stat_attempt_id, :integer
  end
end
