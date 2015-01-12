class AddWinningUserToScore < ActiveRecord::Migration
  def change
    add_column :scores, :winning_user, :integer
  end
end
