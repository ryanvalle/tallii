class AddGameTypeToGame < ActiveRecord::Migration
  def change
    add_column :games, :game_type, :integer
  end
end
