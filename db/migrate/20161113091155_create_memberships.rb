class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.text :name

      t.timestamps
    end
  end
end
