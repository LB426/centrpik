class AddNameToEdumaterials < ActiveRecord::Migration
  def change
    add_column :edumaterials, :name, :string
  end
end
