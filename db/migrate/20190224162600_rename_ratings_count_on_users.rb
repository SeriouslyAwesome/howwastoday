class RenameRatingsCountOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :ratings_count, :reviews_count
  end
end
