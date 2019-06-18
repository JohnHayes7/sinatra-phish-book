class AddMemoryIdToShows < ActiveRecord::Migration
  def change
    add_column(:shows, :memory_id, :integer)
  end
end
