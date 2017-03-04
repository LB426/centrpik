class AddRequestTestingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :request_testing, :boolean, default: false
  end
end
