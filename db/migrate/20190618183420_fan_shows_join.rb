class FanShowsJoin < ActiveRecord::Migration
  def change
    create_join_table :shows, :fans do |t|
      t.index :show_id
      t.index :fan_id
    end
  end
end
