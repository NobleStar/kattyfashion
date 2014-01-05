class AddIsHilitedToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :is_hilited, :boolean, { default: false }
  end
end
