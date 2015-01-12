class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game
      t.integer :user_id
      t.string :game_image
      t.boolean :active

      t.timestamps
    end
  end
end
