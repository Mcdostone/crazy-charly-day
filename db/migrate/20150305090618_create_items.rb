class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nom
      t.float :prix
      t.string :photo
      t.text :description
      t.string :couleur

      t.timestamps null: false
    end
  end
end
