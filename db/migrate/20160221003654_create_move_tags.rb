class CreateMoveTags < ActiveRecord::Migration[5.0]
  def change
    create_table :move_tags do |t|
      t.integer :move_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
