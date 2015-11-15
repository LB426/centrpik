class AddCommentToTestingIntermediateResult < ActiveRecord::Migration
  def change
    add_column :testing_intermediate_results, :comment, :string
  end
end
