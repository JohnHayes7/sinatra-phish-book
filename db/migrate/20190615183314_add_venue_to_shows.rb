class AddVenueToShows < ActiveRecord::Migration
  def change
    add_column(:shows, :venue, :string)
  end
end
