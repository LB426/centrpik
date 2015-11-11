class AddPdexecconfirmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pdexeconfirm, :bool
  end
end
