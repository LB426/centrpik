class CreateEdumaterials < ActiveRecord::Migration
  def change
    create_table :edumaterials do |t|
      t.text :description
      t.string :type

      t.timestamps null: false
    end
  end
end
