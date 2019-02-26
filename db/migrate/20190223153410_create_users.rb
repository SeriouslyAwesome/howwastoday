class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.uuid :uuid
      t.integer :ratings_count, null: false, default: 0

      t.timestamps
    end
  end
end
