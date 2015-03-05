class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.string :email
      t.text :contenu
      t.references :item, index: true

      t.timestamps null: false
    end
    #add_foreign_key :commentaires, :items
  end
end
