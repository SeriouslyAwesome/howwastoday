class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :reviews, :rating
    add_index :reviews, :user_id
  end
end
