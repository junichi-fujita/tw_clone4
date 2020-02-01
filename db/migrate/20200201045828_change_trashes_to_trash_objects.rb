class ChangeTrashesToTrashObjects < ActiveRecord::Migration[5.2]
  def change
    rename_table :tops, :tweets
  end
end
