class AddDefaultValuesForLikes < ActiveRecord::Migration
  def change
  	change_column :items, :likes, :integer, :default => 0
  end
end
