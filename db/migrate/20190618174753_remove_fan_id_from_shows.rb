class RemoveFanIdFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :fan_id
  end
end
