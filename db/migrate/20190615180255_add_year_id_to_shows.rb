class AddYearIdToShows < ActiveRecord::Migration
  def change
    add_column(:shows, :year_id, :integer)
  end
end
