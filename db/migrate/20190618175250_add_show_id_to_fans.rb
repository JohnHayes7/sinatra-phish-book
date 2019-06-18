class AddShowIdToFans < ActiveRecord::Migration
  def change
    add_column(:fans, :show_id, :integer)
  end
end
