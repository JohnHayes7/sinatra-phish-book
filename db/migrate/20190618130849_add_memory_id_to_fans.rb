class AddMemoryIdToFans < ActiveRecord::Migration
  def change
    add_column(:fans, :memory_id, :integer)
  end
end
