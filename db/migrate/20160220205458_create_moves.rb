class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.text :description
      t.text :video_url

      t.timestamps
    end
  end
end
