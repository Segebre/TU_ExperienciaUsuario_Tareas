class RemoveAvatarurlFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :avatar_url, :text
  end
end
