class AddPlayerGroupToScore < ActiveRecord::Migration
  def change
    add_column :scores, :player_group, :string
  end
end
