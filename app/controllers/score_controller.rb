class ScoreController < ApplicationController
	def create
		winning_user = determine_winner(params[:score])
		if params['score']['player_group'].present?
			params['score']['player_group'].shift if params['score']['player_group'][0].blank?
		end
		score = Score.new(
			player: params[:score][:player],
			user_id: current_user.id,
			player_score: params[:score][:player_score],
			user_score: params[:score][:user_score],
			player_group: params[:score][:player_group],
			game_id: params[:score][:game_id],
			winning_user: winning_user
		)
		if score.save
			Rails.logger.debug("Score Save success")
			redirect_to game_show_path(params[:score][:game_id])
		else
			Rails.logger.debug("Score save failed")
			redirect_to game_show_path(params[:score][:game_id])
		end
	end

	private
		def determine_winner(data)
			game = Game.find(data[:game_id])
			if game.game_type == 2
				determine_single_winner(data)
			else
				determine_point_based_winner(data)
			end
		end

		def determine_point_based_winner(data)
			if data[:user_score] > data[:player_score]
				return data[:user_id]
			elsif data[:user_score] < data[:player_score]
				return data[:player]
			end
		end

		def determine_single_winner(data)
			return data[:player]
		end
end