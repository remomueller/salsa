class AddUserIdToMovesAndTags < ActiveRecord::Migration[5.0]
  def up
    add_column :moves, :user_id, :integer
    add_column :tags, :user_id, :integer
    add_index :moves, :user_id
    add_index :tags, :user_id
  end

  def down
    remove_index :tags, :user_id
    remove_index :moves, :user_id
    remove_column :tags, :user_id, :integer
    remove_column :moves, :user_id, :integer
  end
end
