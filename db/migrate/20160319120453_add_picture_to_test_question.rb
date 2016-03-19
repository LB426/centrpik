class AddPictureToTestQuestion < ActiveRecord::Migration
  def up
    add_attachment :test_questions, :picture
  end

  def down
    remove_attachment :test_questions, :picture
  end
end
