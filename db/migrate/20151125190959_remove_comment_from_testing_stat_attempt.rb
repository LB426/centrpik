class RemoveCommentFromTestingStatAttempt < ActiveRecord::Migration
  def change
    remove_column :testing_stat_attempts, :comment, :string    
  end
end
