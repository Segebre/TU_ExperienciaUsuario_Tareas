class ReferencesPnC < ActiveRecord::Migration
  def change
    add_reference :posts, :character, index: true
    add_reference :comments, :character, index: true
  end
end
