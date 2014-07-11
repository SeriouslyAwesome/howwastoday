class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :summary
      t.string :name
      t.text :body

      t.timestamps
    end
    
    add_index :reviews, :created_at
  end
end
