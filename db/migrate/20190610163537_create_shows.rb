class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :date
      t.string :location
      t.string :setlist
    end
  end
end
