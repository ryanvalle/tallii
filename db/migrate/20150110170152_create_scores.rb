class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :player
      t.integer :user_id
      t.integer :player_score
      t.integer :user_score
      t.integer :game_id

      t.timestamps
    end
  end
end
