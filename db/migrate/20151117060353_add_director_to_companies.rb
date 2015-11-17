class AddDirectorToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :chiefname, :string
    add_column :companies, :chiefpost, :string
  end
end
