class Score < ActiveRecord::Base
	validates :player, presence: true

	serialize :player_group, Array
end
