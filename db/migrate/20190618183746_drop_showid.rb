class DropShowid < ActiveRecord::Migration
  def change
    remove_column :fans, :show_id
  end
end
