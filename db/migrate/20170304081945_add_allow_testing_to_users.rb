class AddAllowTestingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allow_testing, :boolean, default: false
  end
end
