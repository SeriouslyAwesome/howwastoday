class RenameTimeZoneOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :time_zone, :timezone
  end
end
