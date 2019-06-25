class DropMemoryIdFromFans < ActiveRecord::Migration
  def change
    remove_column  :fans, :memory_id
  end
end
