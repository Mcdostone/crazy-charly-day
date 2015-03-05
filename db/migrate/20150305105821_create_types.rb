class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type

      t.timestamps null: false
    end
    add_reference :items, :type, index: true
  end
end
