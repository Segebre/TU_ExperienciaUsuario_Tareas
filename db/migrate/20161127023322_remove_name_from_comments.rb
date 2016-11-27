class RemoveNameFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :name, :text
  end
end
