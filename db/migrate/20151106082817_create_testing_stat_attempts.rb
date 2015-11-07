class CreateTestingStatAttempts < ActiveRecord::Migration
  def change
    create_table :testing_stat_attempts do |t|
      t.integer   :user_id
      t.integer   :test_id
      t.integer   :attempt
      t.timestamp :tmbegin
      t.timestamp :tmend
      t.integer   :duration

      t.timestamps null: false
    end
  end
end
