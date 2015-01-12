class Game < ActiveRecord::Base
	validates_uniqueness_of :game
	validates :game, presence: :true
	validates :user_id, presence: :true
	validates :game_type, presence: :true
end
