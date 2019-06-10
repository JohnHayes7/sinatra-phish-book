class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :fan_id
      t.integer :show_id
      t.string :content
    end
  end
end
