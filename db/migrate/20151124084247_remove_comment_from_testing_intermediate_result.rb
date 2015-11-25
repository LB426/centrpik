class RemoveCommentFromTestingIntermediateResult < ActiveRecord::Migration
  def change
    remove_column :testing_intermediate_results, :comment, :string
  end
end
