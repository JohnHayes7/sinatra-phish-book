class ChangeFanIdToFanIds < ActiveRecord::Migration
  def change
    rename_column :shows, :fan_id, :fan_ids
  end
end
