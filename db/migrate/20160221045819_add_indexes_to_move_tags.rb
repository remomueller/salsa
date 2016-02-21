class AddIndexesToMoveTags < ActiveRecord::Migration[5.0]
  def up
    add_index :move_tags, :move_id
    add_index :move_tags, :tag_id
  end

  def down
    remove_index :move_tags, :move_id
    remove_index :move_tags, :tag_id
  end
end
