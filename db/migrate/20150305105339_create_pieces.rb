class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :nom
      t.text :description

      t.timestamps null: false
    end
    add_reference :items, :piece, index: true
  end
end
