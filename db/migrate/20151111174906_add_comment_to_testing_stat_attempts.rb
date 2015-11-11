class AddCommentToTestingStatAttempts < ActiveRecord::Migration
  def change
    add_column :testing_stat_attempts, :comment, :string
  end
end
