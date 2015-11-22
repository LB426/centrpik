class AddFileToEdumaterials < ActiveRecord::Migration
  def up
    add_attachment :edumaterials, :file
  end

  def down
    remove_attachment :edumaterials, :file
  end
end
