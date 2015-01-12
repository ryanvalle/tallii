module ApplicationHelper
	# Determine if the current page is selected
	def is_selected(id)
		if id == params[:nav_action]
			'selected'
		end
	end

	def tally_wins(wins)
		render partial: 'tallii/tallies', locals: {
			tally_five: wins / 5,
			tally_single: wins % 5,
			wins: wins
		}
	end

	def number_of_wins(user,game_id)
		user = User.find(user)
		games = Score.where(winning_user: user.id, game_id: game_id)
		games.count
	end

	def get_player(id)
		user = User.find(id)
		user.username
	end

	def get_player_from_array(ids)
		players = []
		ids.each do |id|
			player = User.find(id.to_i)
			players << player.username
		end
		players.join(', ')
	end
end
