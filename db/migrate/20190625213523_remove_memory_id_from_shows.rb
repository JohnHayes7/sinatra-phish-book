class RemoveMemoryIdFromShows < ActiveRecord::Migration
  def change
    remove_column  :shows, :memory_id
  end
end
