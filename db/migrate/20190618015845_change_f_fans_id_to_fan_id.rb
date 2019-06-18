class ChangeFFansIdToFanId < ActiveRecord::Migration
  def change
    rename_column :shows, :fan_ids, :fan_id
  end
end
