class AddApproveStatementToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :approved, :boolean, column_options: { default: false }
  end
end
