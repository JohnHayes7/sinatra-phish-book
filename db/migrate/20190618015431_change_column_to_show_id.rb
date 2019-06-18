class ChangeColumnToShowId < ActiveRecord::Migration
  def change
    rename_column :fans, :show_ids, :show_id
  end
end
