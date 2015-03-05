class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :types, :type, :materiau
  end
end
