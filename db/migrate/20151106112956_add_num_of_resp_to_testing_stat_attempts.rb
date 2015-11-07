class AddNumOfRespToTestingStatAttempts < ActiveRecord::Migration
  def change
    add_column :testing_stat_attempts, :numquestion, :integer
    add_column :testing_stat_attempts, :numcorrectanswers, :integer
  end
end
