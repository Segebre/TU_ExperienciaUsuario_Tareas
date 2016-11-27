class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.text :name
      t.text :role
      t.references :membership, index: true
      t.text :email
      t.text :avatar_url

      t.timestamps
    end
  end
end
