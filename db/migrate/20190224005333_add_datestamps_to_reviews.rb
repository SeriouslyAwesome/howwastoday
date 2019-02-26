class AddDatestampsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :created_on, :date
    add_index :reviews, :created_on
    add_column :reviews, :updated_on, :date
    add_index :reviews, :updated_on
  end
end
