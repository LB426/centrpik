class AddYotubeLinkToEdumaterials < ActiveRecord::Migration
  def change
    add_column :edumaterials, :youtubelink, :string
  end
end
