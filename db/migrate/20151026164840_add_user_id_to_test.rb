class AddUserIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :user_id, :integer, :null => false
  end
end
