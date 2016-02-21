class CreateUserMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :user_moves do |t|
      t.integer :user_id
      t.integer :move_id
      t.date :practiced_on

      t.timestamps
    end

    add_index :user_moves, [:user_id, :move_id, :practiced_on], unique: true
  end
end
