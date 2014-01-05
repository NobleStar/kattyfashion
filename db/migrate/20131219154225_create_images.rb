class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   :title
      t.string   :description
      t.integer  :w
      t.integer  :h
      t.string   :type
      t.boolean  :is_main
      t.integer  :portfolio_id
      t.string   :image

      t.timestamps
    end
  end
end

    