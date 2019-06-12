class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :value
    end
  end
end
