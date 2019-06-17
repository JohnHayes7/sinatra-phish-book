class AddFanfanIdToShows < ActiveRecord::Migration
  def change
    add_column(:shows, :fan_id, :integer)
  end
end
