class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message
      t.datetime :scheduled_at
      t.text :location
      t.text :avatar_url

      t.timestamps
    end
  end
end
