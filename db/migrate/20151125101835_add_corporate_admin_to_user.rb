class AddCorporateAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :cadmin, :bool
  end
end
