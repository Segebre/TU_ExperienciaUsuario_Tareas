class RemoveUsersAddPasswordDigest < ActiveRecord::Migration
  def change
    add_column :characters, :password_digest, :text
  end
end
