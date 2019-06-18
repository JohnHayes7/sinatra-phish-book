class AddShowOwIdsToFans < ActiveRecord::Migration
  def change
    add_column(:fans, :show_ids, :integer)
  end
end
